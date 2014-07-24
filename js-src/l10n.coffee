define ['text!../locales.xml', 'jquery'], (locales, $) ->
  class L10n
    locales: {}
    fallback: 'en'
    get: (str, lang) ->
      if typeof @locales is 'undefined'
        l = L10n.prototype.locales
      else
        l = @locales
      
      if typeof @fallback is 'undefined'
        fallback = L10n.prototype.fallback
      else
        fallback = @fallback
      
      if !str
        return ''
      
      if typeof lang is 'undefined' and typeof self.lang is 'string'
        lang = self.lang
      
      if !lang
        lang = 'fi'
      
      lang = lang.toString().toLowerCase()
      
      if typeof l[str] is 'undefined' or typeof l[str][lang] is 'undefined' or !l[str][lang]
        if typeof l[str] isnt 'undefined' and typeof l[str][fallback] isnt 'undefined'
          return l[str][fallback]
        return str
      
      return l[str][lang]
  
    setLocales: (locales) ->
      data = $($.parseXML(locales)).find('locale')
      aliases = {}
      
      for i in [0...data.length]
        id = data.eq(i).attr('id')
        children = data.eq(i).find('> *')
        
        if alias = data.eq(i).attr('alias')
          aliases[id] = alias
          continue
        
        @locales[id] = {}
        
        for k in [0...children.length]
          lang = children.eq(k).get(0).tagName.toLowerCase()
          try
            @locales[id][lang] = children.eq(k).html()
          catch error
            @locales[id][lang] = children.eq(k).text()
      
      for alias, key of aliases
        if typeof @locales[key] isnt 'undefined'
          @locales[alias] = @locales[key]
  
  l10n = new L10n
  l10n.setLocales(locales)
  return l10n
