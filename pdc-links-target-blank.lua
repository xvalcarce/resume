ReplacementTable={
      [":jp:"] = "🇯🇵", 
      [":in:"] = "🇮🇳", 
      [":thermometer:"] = "🌡", 
      [":snow_capped_mountain:"] = " 🏔 ", 
      [":beach:"] = " 🏖 ", 
      [":national_park:"] = " 🏞 ", 
      [":money_bag:"] = " 💰 ", 
      [":see_no_evil_monkey:"] = " 🙈 ", 
      [":hear_no_evil_monkey:"] = " 🙉 ", 
      [":speak_no_evil_monkey:"] = " 🙊 "}

function Str (s)
  return pandoc.Str(s.text:gsub("%S+", ReplacementTable))
end

-- Add target="_blank" attributes to all http links in a Pandoc document

local function add_target_blank (link)
    if string.match(link.target, '^http') then  -- here .target == href attribute
        link.attributes.target = '_blank'       -- here .target == traget attribute
    end
    return link
end

-- remove lines 4 and 6 to add target="_blank" to all links, not just http(s)

return {
    { Link = add_target_blank }
}

