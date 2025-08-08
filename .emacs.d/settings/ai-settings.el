(gptel-make-anthropic "Claude"          ;Any name you want
  :stream t                             ;Streaming responses
  :key (getenv "AI_API_KEY"))

(setq
 gptel-model 'claude-3-7-sonnet-20250219 ;  "claude-3-opus-20240229" also available
 gptel-backend (gptel-make-anthropic "Claude"
                 :stream t :key (getenv "AI_API_KEY")))

(provide 'ai-settings)
