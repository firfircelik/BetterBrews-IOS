# 🌾 AgriMarket - Tarım Emtia Ticaret Platformu

AgriMarket, tarım sektörü profesyonelleri için geliştirilmiş, **AgFlow**, **Fastmarkets** ve **Kpler** gibi sektör liderlerinden ilham alan kapsamlı bir iOS uygulamasıdır.

## ✨ Özellikler

### 📊 Gerçek Zamanlı Fiyat Takibi
- Canlı emtia fiyatları (Mısır, Buğday, Soya Fasulyesi, Kahve, Pamuk, Şeker ve daha fazlası)
- Detaylı fiyat geçmişi ve grafikler
- Çoklu zaman dilimi analizi (1G, 1H, 1A, 3A, 6A, 1Y)
- Piyasa istatistikleri ve teknik göstergeler

### 🌍 Küresel Ticaret Akışları
- Dünya çapında emtia ticaretini takip edin
- Gemi takibi ve teslimat durumları
- Liman bilgileri ve rota detayları
- İthalat/ihracat istatistikleri
- Ülke bazlı ticaret analizleri

### 🌤️ Hava Durumu ve Tarımsal Etki Analizi
- Önemli tarım bölgelerinde hava durumu
- 7 günlük tahminler
- Tarımsal risk değerlendirmesi
- Toprak nem seviyeleri
- Hava durumu uyarıları (kuraklık, don, sel vb.)

### 📰 Piyasa Haberleri ve İçgörüler
- Güncel tarım ve emtia haberleri
- Piyasa analiz raporları
- Kategori bazlı filtreleme
- Sentiment analizi (yükseliş/düşüş/nötr)
- Özelleştirilebilir bildirimler

### 📈 Gelişmiş Analitik
- Piyasa trend analizleri
- İstatistiksel raporlar
- Fiyat uyarıları ve bildirimleri
- Özel göstergeler
- Karşılaştırmalı analizler

## 🏗️ Mimari

Uygulama modern iOS geliştirme standartlarını kullanır:

- **SwiftUI**: Kullanıcı arayüzü
- **MVVM Pattern**: Mimari tasarım
- **CoreData**: Yerel veritabanı ve persistence
- **Repository Pattern**: Veri erişim katmanı
- **Combine Framework**: Reaktif programlama
- **Swift Charts**: Veri görselleştirme
- **Async/Await**: Asenkron işlemler
- **Background Fetch**: Otomatik veri güncelleme
- **Web Scraping**: Gerçek piyasa verileri
- **Modüler Yapı**: Bakımı kolay kod organizasyonu

### 📁 Proje Yapısı

```
AgriMarket/
├── Models/              # Veri modelleri
│   ├── Commodity.swift
│   ├── Market.swift
│   ├── PriceData.swift
│   ├── News.swift
│   ├── TradeFlow.swift
│   └── Weather.swift
├── CoreData/            # CoreData stack
│   ├── AgriMarket.xcdatamodeld
│   └── PersistenceController.swift
├── Repositories/        # Data access layer
│   ├── CommodityRepository.swift
│   ├── NewsRepository.swift
│   └── WeatherRepository.swift
├── ViewModels/          # İş mantığı
│   ├── DashboardViewModel.swift
│   └── CommodityViewModel.swift
├── Views/               # UI bileşenleri
│   ├── DashboardView.swift
│   ├── CommoditiesView.swift
│   ├── CommodityDetailView.swift
│   ├── MarketsView.swift
│   ├── NewsView.swift
│   ├── NewsDetailView.swift
│   ├── AnalyticsView.swift
│   └── SettingsView.swift
├── Services/            # API ve servisler
│   ├── NetworkManager.swift
│   ├── CommodityService.swift
│   ├── NewsService.swift
│   ├── TradeFlowService.swift
│   ├── WeatherService.swift
│   ├── WebScrapingService.swift
│   ├── DataParserService.swift
│   ├── DataSyncService.swift
│   └── BackgroundFetchService.swift
└── Resources/           # Kaynaklar
    └── Assets.xcassets
```

## 🗄️ Veritabanı ve Veri Yönetimi

### CoreData Modelleri

Uygulama CoreData kullanarak yerel veri depolaması yapar:

- **CommodityEntity**: Emtia bilgileri ve fiyatları
- **PriceDataEntity**: Geçmiş fiyat verileri
- **NewsEntity**: Haber makaleleri
- **PriceAlertEntity**: Kullanıcı fiyat uyarıları
- **WeatherDataEntity**: Hava durumu verileri

### Repository Pattern

Her veri türü için ayrı repository:

```swift
// Commodity verilerine erişim
let commodities = try await CommodityRepository.shared.fetchAllCommodities()

// Favori emtialar
let favorites = try await CommodityRepository.shared.fetchFavoriteCommodities()

// Fiyat geçmişi
let history = try await CommodityRepository.shared.fetchPriceHistory(
    commodityId: "CORN",
    timeframe: .oneMonth
)
```

## 🕷️ Web Scraping ve Veri Kaynakları

Uygulama gerçek zamanlı veri çekmek için çeşitli kaynaklardan scraping yapar:

### Desteklenen Kaynaklar

- **NASDAQ**: Emtia futures fiyatları
- **Investing.com**: Kapsamlı emtia verileri
- **Trading Economics**: Makroekonomik veriler
- **USDA**: Resmi ABD tarım verileri
- **Reuters**: Finansal haberler
- **AgWeb**: Tarım haberleri
- **Farm Progress**: Sektör haberleri

### Otomatik Veri Senkronizasyonu

```swift
// Tam senkronizasyon
try await DataSyncService.shared.performFullSync()

// Otomatik senkronizasyon başlat
DataSyncService.shared.startAutomaticSync()

// Senkronizasyon aralıkları:
// - Emtialar: Her 5 dakika
// - Haberler: Her 15 dakika
// - Hava Durumu: Her 30 dakika
```

## 🔄 Background Fetch

Uygulama arka planda otomatik olarak güncellenir:

- **App Refresh**: 15 dakikada bir veri güncelleme
- **Cleanup Task**: Günlük eski veri temizleme
- **Smart Notifications**: Önemli fiyat değişikliklerinde bildirim

### Entegrasyon

```swift
// Info.plist'e ekleyin:
<key>BGTaskSchedulerPermittedIdentifiers</key>
<array>
    <string>com.agrimarket.refresh</string>
    <string>com.agrimarket.cleanup</string>
</array>

<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>processing</string>
</array>
```

## 🚀 Başlangıç

### Gereksinimler

- iOS 16.0+
- Xcode 15.0+
- Swift 5.9+

### Kurulum

1. Repository'yi klonlayın:
```bash
git clone https://github.com/firfircelik/BetterBrews-IOS.git
cd BetterBrews-IOS
```

2. Xcode ile projeyi açın:
```bash
open AgriMarket.xcodeproj
```

3. Gerekli bağımlılıkları yükleyin (Swift Package Manager otomatik olarak yükleyecektir)

4. Bir simülatör veya gerçek cihaz seçin ve uygulamayı çalıştırın (⌘ + R)

## 📱 Ekran Görüntüleri

### Ana Özellikler

- **Dashboard**: Piyasa genel görünümü, hava durumu uyarıları ve önemli haberler
- **Commodities**: Tüm emtiaların listesi, kategori filtreleme ve arama
- **Markets**: Küresel piyasalar, ticaret akışları ve bölgesel analizler
- **News**: Son haberler, piyasa içgörüleri ve trendler
- **Analytics**: Hava durumu analizi, trend raporları ve detaylı istatistikler

## 🎯 Desteklenen Emtia Kategorileri

- 🌾 **Tahıllar**: Mısır, Buğday, Arpa
- 🫘 **Yağlı Tohumlar**: Soya Fasulyesi, Kanola
- ☕ **Yumuşak Emtialar**: Kahve, Pamuk, Şeker, Kakao
- 🥩 **Hayvancılık**: Sığır, Domuz
- 🥛 **Süt Ürünleri**: Süt, Peynir, Tereyağı
- 🧪 **Gübreler**: Üre, DAP, Potasyum
- ⚡ **Enerji**: Biyodizel, Etanol
- 🔩 **Metaller**: Bakır, Alüminyum

## 🔮 Gelecek Özellikler

- [x] CoreData yerel veritabanı
- [x] Web scraping servisleri
- [x] Otomatik veri senkronizasyonu
- [x] Background fetch
- [x] Repository pattern
- [x] HTML/JSON parser
- [ ] Machine Learning fiyat tahminleri
- [ ] Push bildirimleri (temel yapı hazır)
- [ ] Portföy takibi ve P&L analizi
- [ ] Gelişmiş teknik göstergeler (RSI, MACD, Bollinger Bands)
- [ ] Çoklu dil desteği (İngilizce, İspanyolca, Portekizce)
- [ ] Dark mode iyileştirmeleri
- [ ] iPad optimizasyonu
- [ ] watchOS uygulaması
- [ ] Widget desteği
- [ ] Sosyal paylaşım özellikleri
- [ ] PDF rapor oluşturma

## 🛠️ Teknolojiler

- **Language**: Swift 5.9
- **UI Framework**: SwiftUI
- **Architecture**: MVVM
- **Concurrency**: async/await, Combine
- **Charts**: Swift Charts
- **Storage**: UserDefaults, CoreData (yakında)
- **Networking**: URLSession

## 📖 API Referansı

Şu anda uygulama örnek verilerle çalışmaktadır. Gerçek API entegrasyonu için:

```swift
// NetworkManager.swift içinde baseURL'i güncelleyin
private let baseURL = "https://your-api-endpoint.com/v1"
```

## 🤝 Katkıda Bulunma

Katkılarınızı bekliyoruz! Lütfen şu adımları takip edin:

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/AmazingFeature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add some AmazingFeature'`)
4. Branch'inizi push edin (`git push origin feature/AmazingFeature`)
5. Pull Request açın

## 📝 Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## 👨‍💻 Geliştirici

**Fırat Fırfır**

## 🙏 Teşekkürler

Bu uygulama, tarım emtia ticareti alanındaki lider platformlardan ilham almıştır:

- [AgFlow](https://www.agflow.com) - Tarımsal ticaret zekası
- [Fastmarkets](https://www.fastmarkets.com) - Emtia fiyat bilgisi
- [Kpler](https://www.kpler.com) - Küresel ticaret akışları

## 📞 İletişim

Sorularınız veya önerileriniz için:
- Email: support@agrimarket.com
- Website: https://agrimarket.com

---

**Not**: Bu uygulama eğitim amaçlı geliştirilmiştir ve şu anda örnek verilerle çalışmaktadır. Gerçek ticaret kararları almak için profesyonel danışmanlık alınması önerilir.
