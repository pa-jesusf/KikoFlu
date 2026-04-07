package com.meteor.kikoeruflutter

import android.content.Context
import android.graphics.Color
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.util.TypedValue
import android.view.Gravity
import android.view.HapticFeedbackConstants
import android.view.MotionEvent
import android.view.View
import android.view.ViewConfiguration
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.TextView

/**
 * 悬浮字幕视图
 * 美观、简洁、现代化的设计，支持拖动
 */
class FloatingLyricView(
    context: Context,
    private val windowManager: WindowManager,
    private val layoutParams: WindowManager.LayoutParams,
    initialTouchEnabled: Boolean,
    private val onTouchEnabledChanged: (Boolean) -> Unit
) : FrameLayout(context) {
    private val textView: TextView
    private val lockIndicator: ImageView
    
    // 触摸事件相关变量
    private var initialX: Int = 0
    private var initialY: Int = 0
    private var initialTouchX: Float = 0f
    private var initialTouchY: Float = 0f
    private var isDragging = false
    private var longPressTriggered = false
    private val dragThreshold = 10f // 拖动阈值，避免点击误触发
    private val longPressTimeout = ViewConfiguration.getLongPressTimeout().toLong()

    private val longPressRunnable = Runnable {
        longPressTriggered = true
        touchEnabled = !touchEnabled
        performHapticFeedback(HapticFeedbackConstants.LONG_PRESS)
        onTouchEnabledChanged(touchEnabled)
    }

    // 是否允许触摸交互（拖动等）
    var touchEnabled: Boolean = initialTouchEnabled
        set(value) {
            field = value
            updateLockIndicator()
        }

    // 当前样式状态
    private var currentBackgroundColor: Int = Color.parseColor("#F2000000")
    private var currentCornerRadius: Float = 16f

    init {
        // 使用 GradientDrawable 创建圆角背景
        updateBackground()
        clipChildren = false
        clipToPadding = false
        
        setPadding(
            dpToPx(20f).toInt(),
            dpToPx(10f).toInt(),
            dpToPx(20f).toInt(),
            dpToPx(10f).toInt()
        )
        elevation = dpToPx(12f) // 增加阴影深度

        // 创建文本视图
        textView = TextView(context).apply {
            textSize = 16f
            setTextColor(Color.WHITE)
            typeface = Typeface.create(Typeface.DEFAULT, Typeface.NORMAL) // 使用常规字重
            gravity = Gravity.CENTER
            // 不添加文本阴影，保持简洁
            maxLines = 6
            ellipsize = android.text.TextUtils.TruncateAt.END
            letterSpacing = 0.02f // 增加字间距，更易阅读
        }

        addView(textView, LayoutParams(
            LayoutParams.WRAP_CONTENT,
            LayoutParams.WRAP_CONTENT
        ))

        lockIndicator = ImageView(context).apply {
            setImageResource(android.R.drawable.ic_lock_lock)
            setColorFilter(Color.WHITE)
            alpha = 0.7f
        }

        // 将图标放在 padding 区域（右上角边框空白处），使用负 margin 突破内容区
        addView(lockIndicator, LayoutParams(
            dpToPx(10f).toInt(),
            dpToPx(10f).toInt(),
            Gravity.END or Gravity.TOP
        ).apply {
            topMargin = -dpToPx(8f).toInt()
            rightMargin = -dpToPx(16f).toInt()
        })

        updateLockIndicator()
    }

    override fun onTouchEvent(event: MotionEvent): Boolean {
        when (event.action) {
            MotionEvent.ACTION_DOWN -> {
                // 记录初始位置
                initialX = layoutParams.x
                initialY = layoutParams.y
                initialTouchX = event.rawX
                initialTouchY = event.rawY
                isDragging = false
                longPressTriggered = false
                removeCallbacks(longPressRunnable)
                postDelayed(longPressRunnable, longPressTimeout)
                return true
            }
            
            MotionEvent.ACTION_MOVE -> {
                // 计算移动距离
                val dx = event.rawX - initialTouchX
                val dy = event.rawY - initialTouchY
                
                // 判断是否超过拖动阈值
                if (!isDragging && (Math.abs(dx) > dragThreshold || Math.abs(dy) > dragThreshold)) {
                    removeCallbacks(longPressRunnable)
                    if (touchEnabled) {
                        isDragging = true
                    }
                }
                
                if (isDragging && touchEnabled) {
                    // 更新悬浮窗位置
                    layoutParams.x = initialX + dx.toInt()
                    layoutParams.y = initialY + dy.toInt()
                    
                    try {
                        windowManager.updateViewLayout(this, layoutParams)
                    } catch (e: Exception) {
                        // 忽略更新失败
                    }
                }
                return true
            }
            
            MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                removeCallbacks(longPressRunnable)
                if (!isDragging && !longPressTriggered) {
                    // 如果没有拖动，可以在这里处理点击事件
                    performClick()
                }
                return true
            }
        }
        return super.onTouchEvent(event)
    }

    override fun performClick(): Boolean {
        super.performClick()
        // 可以在这里添加点击事件处理
        return true
    }

    private fun updateLockIndicator() {
        lockIndicator.visibility = if (touchEnabled) View.GONE else View.VISIBLE
    }

    /**
     * 更新显示的文本
     */
    fun updateText(text: String) {
        textView.text = text
    }

    /**
     * 更新背景
     */
    private fun updateBackground() {
        val drawable = GradientDrawable().apply {
            setColor(currentBackgroundColor)
            cornerRadius = dpToPx(currentCornerRadius)
        }
        background = drawable
    }

    /**
     * 更新样式
     */
    fun updateStyle(
        fontSize: Float?,
        textColor: Int?,
        backgroundColor: Int?,
        cornerRadius: Float?,
        paddingHorizontal: Float?,
        paddingVertical: Float?,
        textStrokeWidth: Float?
    ) {
        fontSize?.let {
            textView.textSize = it
        }
        textColor?.let {
            textView.setTextColor(it)
        }
        
        var backgroundChanged = false
        backgroundColor?.let {
            currentBackgroundColor = it
            backgroundChanged = true
        }
        cornerRadius?.let {
            currentCornerRadius = it
            backgroundChanged = true
        }
        
        if (backgroundChanged) {
            updateBackground()
        }

        if (paddingHorizontal != null || paddingVertical != null) {
            val pH = paddingHorizontal?.let { dpToPx(it).toInt() } ?: paddingLeft
            val pV = paddingVertical?.let { dpToPx(it).toInt() } ?: paddingTop
            setPadding(pH, pV, pH, pV)
        }

        textStrokeWidth?.let { width ->
            if (width > 0f) {
                val radius = dpToPx(width)
                val color = textView.currentTextColor
                // Use shadow to simulate stroke/outline effect
                textView.setShadowLayer(radius, 0f, 0f, color)
            } else {
                textView.setShadowLayer(0f, 0f, 0f, Color.TRANSPARENT)
            }
        }
    }

    /**
     * dp 转 px
     */
    private fun dpToPx(dp: Float): Float {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            dp,
            resources.displayMetrics
        )
    }
}
