{...}: ''
  (defwidget net []
    (eventbox
      :onhover "''${EWW_CMD} update net_rev=true"
      :onhoverlost "''${EWW_CMD} update net_rev=false"
      (box
        :space-evenly "false"
        (revealer
          :transition "slideright"
          :reveal net_rev
          :duration "350ms"
          (label
            :class "module_ssid module"
            :style "color: ''${net_color};"
            :text net_ssid))
        (button
          :class "module_net module"
          :onclick "networkmanager_dmenu"
          :style "color: ''${net_color};"
          net_icon))))
''
