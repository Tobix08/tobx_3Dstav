
Config = {
    language = 'cs',
    color = { r = 152, g = 203, b = 234, a = 255 }, -- barva text (hráči si to můžou dát sami tím že dají /stav ~g~[jejich text]) (nemusí tam být jen ~g~ ale i jiné barvy)
    font = 0, -- font textu
    time = 300000, -- jak dlouho bude text vidět (v ms)
    dist = 250, -- min. vzdalentost při které jde vidět stav text
    scale = 200,
}

-- Languages available
Languages = {
    ['cs'] = {
        commandName = 'stav',
        commandDescription = 'momentalni stav se objevi nad vasi hlavou',
        commandSuggestion = {{ name = 'stav', help = 'npr."ma pripnotou sbran na opasku".'}},
        prefix = '~y~stav:~w~ '
    },
}
