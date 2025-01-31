function nindycore.core.gui.create_base_window(player, name, windowDirection, isScrollPane, showTitle, showMainFrame, mainFrameDirection)
    if player == nil then return end
    if player.gui.screen[name] ~= nil and player.gui.screen[name].valid == true then player.gui.screen[name].destroy() end
    if player.gui.screen[name] ~= nil and player.gui.screen[name].valid == false then player.gui.screen[name] = nil end

    local guiTable = {player=player, vars={}, gui=nil}
    guiTable.gui = player.gui.screen.add{type="frame", name=name, direction=windowDirection or "vertical"}
    guiTable.gui.style.padding = 5
    guiTable.gui.style.top_padding = 0
    guiTable.gui.style.margin = 0

    if showTitle == true then nindycore.core.gui.create_title(guiTable) end
    if showMainFrame == true then
        local mainFrame = nil
        if isScrollPane == false then
            mainFrame = nindycore.core.gui.add_frame(guiTable, nindycore.core.gui.titles["main"], guiTable.gui, mainFrameDirection or "vertical", true)
            mainFrame.style = "invisible_frame"
        else
            mainFrame = nindycore.core.gui.add_scroll_pane(guiTable, nindycore.core.gui.titles["main"], guiTable.gui, nil, true)
        end
        mainFrame.style.vertically_stretchable = true
    end
    nindycore.core.gui.set_size(guiTable.gui, 10, 10)
    nindycore.core.gui.center_window(guiTable.gui)
    nindycore.core.gui.add_close_button(guiTable)
    return guiTable
end

function nindycore.core.gui.set_size(gui, height, width)
    if height ~= nil then gui.style.natural_height = height end
    if width ~= nil then gui.style.natural_width = width end
end

function nindycore.core.gui.create_title(guiTable)
    local topBarFlow = nindycore.core.gui.add_flow(guiTable, "topBarFlow", guiTable.gui, "horizontal", true)
    topBarFlow.style.vertical_align = "center"
    topBarFlow.style.padding = 0
    topBarFlow.style.margin = 0

    local barTitle = {"gui-description." .. guiTable.gui.name .. "-Title"}
    nindycore.core.gui.add_label(guiTable, "title", topBarFlow, barTitle, nindycore.core.gui.colors["orange"], nil, true, nindycore.core.gui.fonts["H-18"])

    local dragArea = nindycore.core.gui.add_empty_widget(guiTable, "", topBarFlow, guiTable.gui, 25)
    dragArea.style.left_margin = 8
    dragArea.style.right_margin = 8
    dragArea.style.minimal_width = 30
end

function nindycore.core.gui.add_flow(guiTable, name, gui, direction, save)
    if name ~= nil and name ~= "" and gui[name] ~= nil then gui[name].destroy() end
    local flow = gui.add{type="flow", name=name, direction=direction}
    flow.style.padding = 0
    flow.style.margin = 0
    flow.style.horizontally_stretchable = true
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = flow
    end
    return flow
end

function nindycore.core.gui.add_close_button(guiTable)
    local button = nindycore.core.gui.add_button(guiTable, guiTable.gui.name .. "_CloseButton", guiTable.vars.topBarFlow, "utility.close", "utility.close_black", "utility.close_black", {"gui-description."..nindycore.core.add_mod_tag("CloseButton")}, 20)
    button.style = "frame_action_button"
end

function nindycore.core.gui.center_window(guiTable)
    guiTable.force_auto_center()
end

function nindycore.core.gui.add_frame(guiTable, name, gui, direction, save)
    if name ~= nil and name ~= "" and gui[name] ~= nil then gui[name].destroy() end
    local frame = gui.add{type="frame", name=name, direction=direction}
    frame.style.padding = 0
    frame.style.margin = 0
    frame.style.horizontally_stretchable = true
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = frame
    end
    return frame
end

function nindycore.core.gui.add_scroll_pane(guiTable, name, gui, width, height, save, style, scroll_verically, scroll_horizontally)
    if name ~= nil and name ~= "" and gui[name] ~= nil then gui[name].destroy() end
    local scrollPane = gui.add{type="scroll-pane", name=name, horizontal_scroll_policy=scroll_horizontally or "never", vertical_scroll_policy=scroll_verically or "always"}
    if style ~= nil then scrollPane.style = style end
    scrollPane.style.padding = 0
    scrollPane.style.margin = 0
    scrollPane.style.maximal_height = height
    scrollPane.style.maximal_width = width
    scrollPane.style.horizontally_stretchable = true
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = scrollPane
    end
    return scrollPane
end

function nindycore.core.gui.add_button(guiTable, name, gui, sprite, hoverSprite, clickedSprite, tooltip, size, save, visible, count, style, tags)
    if visible == false then return end
    if name ~= nil and name ~= "" and gui[name] ~= nil then gui[name].destroy() end
    local button = gui.add{type="sprite-button", name=name, sprite=sprite, hovered_sprite=hoverSprite, clicked_sprite=clickedSprite, resize_to_sprite=false, tooltip=tooltip, number=count, tags=tags}
    if style ~= nil then button.style = style end
    button.style.minimal_width = size
    button.style.maximal_width = size
    button.style.minimal_height = size
    button.style.maximal_height = size
    button.style.padding = 0
    button.style.margin = 0
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = button
    end
    return button
end

function nindycore.core.gui.add_simple_button(guiTable, name, gui, text, tooltip, save, tags)
    if name ~= nil and name ~= "" and gui[name] ~= nil then gui[name].destroy() end
    local button = gui.add{type="button", name=name, caption=text, tooltip=tooltip, tags=tags}

    if guiTable ~= nil and save == true then
        guiTable.vars[name] = button
    end
    return button
end

function nindycore.core.gui.add_label(guiTable, name, gui, text, color, tooltip, save, font, style)
    if name ~= nil and name ~= "" and gui[name] ~= nil then gui[name].destroy() end

    local label = gui.add{type="label", name, caption=text, tooltip=tooltip}
    if style ~= nil then
        label.style = style
    else
        label.style.font = font or nindycore.core.gui.fonts["16"]
        label.style.font_color = color or nindycore.core.gui.colors["white"]
    end
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = label
    end
    return label
end

function nindycore.core.gui.add_empty_widget(guiTable, name, gui, parent, sizeX, sizeY, save)
    if name ~= nil and name ~= "" and gui[name] ~= nil then gui[name].destroy() end
    local widget = gui.add{type="empty-widget", name=name, style="draggable_space"}
    widget.drag_target = parent
    if sizeX ~= nil then widget.style.height = sizeX end
    if sizeY ~= nil then widget.style.width = sizeY end
    widget.style.padding = 0
    widget.style.margin = 0
    widget.style.horizontally_stretchable = true
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = widget
    end
    return widget
end

function nindycore.core.gui.add_line(guiTable, name, gui, direction, save)
    if name ~= nil and name ~= "" and gui[name] ~= nil then gui[name].destroy() end
    local line = gui.add{type="line", name=name, direction=direction}
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = line
    end
    return line
end

function nindycore.core.gui.add_subtitle(guiTable, name, gui, text, save)
    local flow = nindycore.core.gui.add_flow(guiTable, "", gui, "vertical", save)
    flow.style.horizontal_align = "center"
    flow.style.vertically_stretchable = false
    nindycore.core.gui.add_line(guiTable, "", flow, "horizontal")
    local label = nindycore.core.gui.add_label(guiTable, "", flow, text, nil, nil, false, nil, "yellow_label")
    label.style.left_margin = 10
    label.style.right_margin = 10
    nindycore.core.gui.add_line(guiTable, "", flow, "horizontal")
end

function nindycore.core.gui.add_table(guiTable, name, gui, column, save)
    if name ~= nil and name ~= "" and gui[name] ~= nil then gui[name].destroy() end
    local tableGui = gui.add{type="table", name=name, column_count=column}
    tableGui.style.padding = 0
    tableGui.style.margin = 0
    tableGui.style.cell_padding = 0
    tableGui.style.horizontal_spacing = 0
    tableGui.style.vertical_spacing = 0
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = tableGui
    end
    return tableGui
end

function nindycore.core.gui.add_sprite(guiTable, name, gui, path, tooltip, save)
    if name ~= nil and name ~= "" and gui[name] ~= nil then gui[name].destroy() end
    local sprite = gui.add{type="sprite", name=name, sprite=path, tooltip=tooltip}
    sprite.style.padding = 0
    sprite.style.margin = 0
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = sprite
    end
    return sprite
end

function nindycore.core.gui.add_item_frame(guiTable, name, gui, tooltip, item, amount, itemSize, fontStyle, color, save)
    local frame = nindycore.core.gui.add_frame(guiTable, name, gui, "horizontal")
    local sprite = nindycore.core.gui.add_sprite(guiTable, "", frame, "item/" .. item, tooltip or game.item_prototypes[item].localised_name)
    if itemSize ~= nil then
        sprite.resize_to_sprite = false
        sprite.style.size = itemSize
    end
    local label = nindycore.core.gui.add_label(guiTable, "", frame, amount, color)
    label.style.vertical_align = "center"
    label.style.horizontal_align = "center"
    label.style.size = itemSize
    if fontStyle ~= nil then
        label.style.font = fontStyle
    end
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = frame
    end
    return frame
end

function nindycore.core.gui.add_progress_bar(guiTable, name, gui, text, tooltip, save, color, value, size, bar_width)
    if name ~= nil and name ~= "" and gui[name] ~= nil then gui[name].destroy() end

    local progressBar = gui.add{type="progressbar", name=name, caption=text, tooltip=tooltip}
    if color ~= nil then progressBar.style.color = color end

    if size ~= nil then progressBar.style.maximal_width = size end
    if bar_width ~= nil then progressBar.style.bar_width = bar_width end
    progressBar.style.horizontally_stretchable = true

    if value ~= nil then progressBar.value = value end

    if guiTable ~= nil and save == true then
        guiTable.vars[name] = progressBar
    end
    return progressBar
end

function nindycore.core.gui.add_text_field(guiTable, name, gui, text, tooltip, save, numeric, allowDecimal, allowNegative, isPassword, tags)
    if name ~= nil and name ~= "" and gui[name] ~= nil then gui[name].destroy() end
    local textField = gui.add{type="textfield", name=name, text=text, tooltip=tooltip, numeric=numeric or false, allow_decimal=allowDecimal or false, allow_negative=allowNegative or false, is_password=isPassword or false, tags=tags}
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = textField
    end
    return textField
end

function nindycore.core.gui.add_switch(guiTable, name, gui, text1, text2, tooltip1, tooltip2, state, save, tags)
    if gui[name] ~= nil then gui[name].destroy() end
    local switch = gui.add{type="switch", name=name, switch_state=state or "left", left_label_caption=text1, right_label_caption=text2, left_label_tooltip=tooltip1, right_label_tooltip=tooltip2, tags=tags}

    if guiTable ~= nil and save == true then
        guiTable.vars[name] = switch
    end
    return switch
end

function nindycore.core.gui.add_filter(guiTable, name, gui, tooltip, save, elemType, size, tags)
    if gui[name] ~= nil then gui[name].destroy() end
    local filter = gui.add{type="choose-elem-button", name=name, tooltip=tooltip, elem_type=elemType, tags=tags}
    filter.style.height = size
    filter.style.width = size
    
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = filter
    end
    return filter
end

function nindycore.core.gui.add_checkbox(guiTable, name, gui, text, tooltip, state, save, tags)
    if gui[name] ~= nil then gui[name].destroy() end
    local checkBox = gui.add{type="checkbox", name=name, caption=text, tooltip=tooltip, state=state or false, tags = tags}

    if guiTable ~= nil and save == true then
        guiTable.vars[name] = checkBox
    end
    return checkBox
end

function nindycore.core.gui.add_dropdown(guiTable, name, gui, values, selected, save, tooltip, tags)
    if gui[name] ~= nil then gui[name].destroy() end
    local dropDown = gui.add{type="drop-down", name=name, items=values, selected_index=selected, tooltip=tooltip, tags=tags}

    dropDown.style.maximal_width = 200
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = dropDown
    end
    return dropDown
end

function nindycore.core.gui.add_slider(guiTable, name, gui, min, max, initial, step, save, tooltip, tags, d_slider, d_values)
    if gui[name] ~= nil then gui[name].destroy() end
    local slider = gui.add{type="slider", name=name, minimum_value=min, maximum_value=max, value=initial, value_step=step, discrete_slider=d_slider, discrete_values=d_values, tooltip=tooltip, tags=tags}

    slider.style.maximal_width = 250
    if guiTable ~= nil and save == true then
        guiTable.vars[name] = slider
    end
    return slider
end