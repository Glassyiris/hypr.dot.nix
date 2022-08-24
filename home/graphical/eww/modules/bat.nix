{pop, ...}: ''
  (defwidget bat []
    (circular-progress
      :value "''${EWW_BATTERY["BAT0"].capacity}"
      :class "batbar module"
      :style "color: ''${bat_color};"
      :thickness 3
      (button
        :tooltip "battery on ''${EWW_BATTERY["BAT0"].capacity}%"
        :onclick "${pop} system"
        (label :class "icon_text" :text ""))))
''
