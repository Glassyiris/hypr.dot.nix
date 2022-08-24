{...}: ''
  (defwidget volume_window []
    (box
      :class "volume_window"
      :orientation "v"
      (box
        :halign "v"
        :space-evenly "false"
        (box
          :class "volume_icon speaker_icon"
          :orientation "v")
        (box
          :orientation "v"
          (label
            :class "volume_text"
            :text "speaker")
          (box
            :class "volume_bar"
            (scale
              :value vol_percent
              :onchange "volume setvol SINK {}"
              :tooltip "volume on ''${vol_percent}%"))))
      (box
        :halign "v"
        :space-evenly "false"
        (box
          :class "volume_icon mic_icon"
          :orientation "v")
          (box
            :orientation "v"
            (label
              :class "volume_text"
              :text "mic")
            (box
              :class "volume_bar"
              (scale
                :value mic_percent
                :tooltip "mic on ''${mic_percent}%"
                :onchange "volume setvol SOURCE {}"))))))

  (defwindow volume_win
    :monitor 0
    :geometry (geometry
      :x "0%"
      :y "1%"
      :anchor "top right"
      :width "0"
      :height "0")
    (volume_window))
''
