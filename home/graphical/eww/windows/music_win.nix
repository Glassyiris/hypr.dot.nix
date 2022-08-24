{music, ...}: ''
  (defwidget music_window []
    (box
      :class "music_window"
      (box
        :class "music_cover_art"
        :style "background-image: url(\"''${cover_art}\");")
      (box
        :orientation "v"
        :class "music_box"
        (label
          :class "music_title"
          :limit-width 18
          :text song_title)
        (label
          :class "music_artist"
          :wrap "true"
          :limit-width 30
          :text song_artist)
        (centerbox
          :halign "center"
          :class "music_button_box"
          (button :class "music_button" :onclick "${music} prev" "")
          (button :class "music_button" :onclick "${music} toggle" song_status)
          (button :class "music_button" :onclick "${music} next" ""))
        (box
          :orientation "v"
          (centerbox
            (label
              :xalign 0
              :class "music_time"
              :text song_pos)
            (label)
            (label
              :xalign 1
              :class "music_time"
              :text song_length))
          (box
            :class "music_bar"
            (scale
              :active "false"
              :value song_pos_perc))))))

  (defwindow music_win
    :stacking "fg"
    :focusable "false"
    :monitor 0
    :geometry (geometry
      :x "0%"
      :y "1%"
      :width "0%"
      :height "0%"
      :anchor "top center")
    (music_window))
''
