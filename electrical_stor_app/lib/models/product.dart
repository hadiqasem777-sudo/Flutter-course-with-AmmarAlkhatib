class Product {
  final int id, price;
  final String title, subTitle, description, image;

  Product(
      {required this.id,
      required this.price,
      required this.title,
      required this.subTitle,
      required this.description,
      required this.image});
}

// list of products
List<Product> products = [
  Product(
    id: 1,
    price: 59,
    title: "سماعات لاسلكية",
    subTitle: "جودة صوت عالية",
    image: "images/airpod.png",
    description:
        "استمتع بتجربة صوتية استثنائية مع هذه السماعات اللاسلكية التي توفر صوتاً نقياً وعزلاً للضوضاء، مع تصميم مريح وبطارية تدوم طويلاً لترافقك طوال اليوم.",
  ),
  Product(
    id: 2,
    price: 1099,
    title: "جهاز موبايل",
    subTitle: "وأصبح للموبايل قوة",
    image: "images/mobile.png",
    description:
        "هاتف ذكي يتميز بشاشة عالية الدقة ومعالج قوي لتشغيل أحدث التطبيقات والألعاب بسلاسة، بالإضافة إلى نظام كاميرا احترافي لالتقاط أجمل اللحظات بوضوح فائق.",
  ),
  Product(
    id: 3,
    price: 39,
    title: "نظارات ثلاثية الأبعاد",
    subTitle: "لنقلك للعالم الافتراضي",
    image: "images/class.png",
    description:
        "اكتشف عوالم جديدة وتجارب غامرة مع نظارات الواقع الافتراضي هذه، المصممة لتوفير راحة تامة أثناء الاستخدام وزاوية رؤية واسعة تحاكي الواقع تماماً.",
  ),
  Product(
    id: 4,
    price: 56,
    title: "سماعات",
    subTitle: "لساعات استماع طويلة",
    image: "images/headset.png",
    description:
        "سماعات رأس مريحة مصممة لجلسات الاستماع الطويلة، تتميز بجهير عميق وصوت محيطي رائع، مع تصميم عصري قابل للطي لتسهيل حملها في أي مكان.",
  ),
  Product(
    id: 5,
    price: 68,
    title: "مسجل صوت",
    subTitle: "سجل اللحظات المهمة حولك",
    image: "images/speaker.png",
    description:
        "جهاز تسجيل صوتي مدمج وعالي الدقة، مثالي لتسجيل المحاضرات، المقابلات، والاجتماعات بوضوح تام بفضل تقنية تقليل الضوضاء والميكروفون المزدوج.",
  ),
  Product(
    id: 6,
    price: 39,
    title: "كاميرات كمبيوتر",
    subTitle: "بجودة ودقة صورة عالية",
    image: "images/camera.png",
    description:
        "كاميرا ويب عالية الدقة (HD) مثالية لمكالمات الفيديو، الاجتماعات عن بُعد، والبث المباشر، مزودة بميكروفون مدمج عالي الحساسية لضمان جودة استثنائية للصوت والصورة.",
  ),
];