class GoogleSpreadsheetsParser

  constructor: (publishedUrl, hasTitle = false) ->
    _util = new GoogleSpreadsheetsUtil()

    key = _util.extractKey(publishedUrl)
    mtd = _util.getWorksheetId(key)
    feeds = _util.getFeeds(key, mtd)

    feedEntry = feeds.feed.entry

    @titles = _util.makeTitle(feedEntry) if hasTitle
    @contents = _util.makeContents(feedEntry)
