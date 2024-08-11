enum ArticleType {
  all,
  like,
  dislike,
  zhihu,
  juejin,
  weibo,
  toutiao,
  huPu,
  zhihuDay,
  three6Ke,
  bilibili,
  baiduRD,
  douyinHot,
  douban,
  huXiu,
  woShiPm
}

enum ArticleStatus {
  unread,
  read,
  clicked,
  like,
  dislike,
}

enum OpinionType {
  neutral,
  like,
  dislike,
}

String articleTypeToString(ArticleType type) {
  switch (type) {
    case ArticleType.all:
      return '全部';
    case ArticleType.zhihu:
      return '知乎';
    case ArticleType.zhihuDay:
      return '知乎日报';
    case ArticleType.juejin:
      return '掘金';
    case ArticleType.three6Ke:
      return '36Ke';
    case ArticleType.bilibili:
      return '哔哩哔哩';
    case ArticleType.baiduRD:
      return '百度热搜';
    case ArticleType.douyinHot:
      return '抖音热搜';
    case ArticleType.douban:
      return '豆瓣';
    case ArticleType.huXiu:
      return '虎嗅';
    case ArticleType.woShiPm:
      return '人人';
    case ArticleType.toutiao:
      return '头条';
    case ArticleType.huPu:
      return '虎扑';
    case ArticleType.weibo:
      return '微博';
    default:
      return '未知类型';
  }
}