'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "474e38d3d29821adf871c60dbb5cb81a",
"version.json": "f15c58bca5f39b816821105e43e3983e",
"index.html": "432a9e4871bdd0f3c9a98837c8a5d902",
"/": "432a9e4871bdd0f3c9a98837c8a5d902",
"main.dart.js": "157e6e6afa8e88011df6179ed8d759f3",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "2f2fbc64a8855c14d28f884c38ec86ee",
"assets/AssetManifest.json": "29aaae36d330ec620e35dbad7d600b17",
"assets/NOTICES": "328bef054a2708872d0e81e13ea61fe2",
"assets/FontManifest.json": "d54bba6f47d16e4e272fc3205b9fdfbe",
"assets/AssetManifest.bin.json": "7b4404a38aa6a6448960a6c0c3e91841",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "3e08f62480019d0a78e93137c009415a",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/assets/icons/home/ic_home_feature_serviceinformation.png": "fefdba6b45d1cb06637d63ebaa2b906e",
"assets/assets/icons/home/ic_home_feature_vehiclediagnostic.png": "e64e9d68cc2443e1287b7a078600c0af",
"assets/assets/icons/home/ic_home_menu_hazard.png": "d499f54542a16773c228e45b2b6b5daa",
"assets/assets/icons/home/ic_home_feature_mycarlog.png": "fc01a87dc40400c6ba72bc1f65e4d55c",
"assets/assets/icons/home/ic_home_feature_climatecontrol.png": "d96d3e69d48d592626f9928b871960ba",
"assets/assets/icons/home/ic_home_action_fan.png": "160bed04a80c544baa43c6a61546a29f",
"assets/assets/icons/home/ic_home_feature_softwareupdate.png": "f02e9c5e76d9a574def51f585c8c0c2d",
"assets/assets/icons/home/ic_home_findcard_bg.png": "03617f99fbc36570ced3de388266cdc9",
"assets/assets/icons/home/ic_home_findcar_location.png": "dd17994b8a1683372f0c1ba457ca8610",
"assets/assets/icons/home/ic_home_action_hazard.png": "65c36aed1c71173b36c47c6ed7890333",
"assets/assets/icons/home/ic_home_geofence_location.png": "f4cad65fb40b5c809082b9aa5bc2d76a",
"assets/assets/icons/home/ic_home_action_horn.png": "1e0e763e40d24f10c474448d867b17c6",
"assets/assets/icons/home/ic_home_warning_info.png": "262e15a6c076b8406570d06b125b2f72",
"assets/assets/icons/home/ic_home_feature_remotecontrol.png": "837169659d06dbf0cfe91ea373a70da5",
"assets/assets/icons/home/ic_home_remote_car_check.png": "69395486494d4998b195ee906cff27f4",
"assets/assets/icons/home/ic_home_warning_alert_yellow_close.png": "5de9e5cc0c773d407d94056cd2ea6465",
"assets/assets/icons/home/ic_home_feature_findmycar.png": "068defeb4922f3d9d2b054d8ef578e56",
"assets/assets/icons/home/ic_home_dropdown.png": "811e363d4eb7e83e791b919204718b64",
"assets/assets/icons/home/ic_home_geofence_bg.png": "702aa4370958c152ba2dea521d737e90",
"assets/assets/icons/home/ic_home_fuel.png": "0713109f746f74bc605c2b33b6cf2eec",
"assets/assets/icons/home/ic_home_warning_alert_red_close.png": "99c507b5d293ca3863396533ddf8ccfa",
"assets/assets/icons/home/ic_home_feature_geofence.png": "de336ae0df67631342ae504b4ba3ce86",
"assets/assets/icons/home/ic_home_feature_chevronup.png": "7014014bdede6b45402d4e75ac10b0af",
"assets/assets/icons/home/ic_home_car.png": "c53462b5c8337ad041fcbb05aeb56353",
"assets/assets/icons/home/ic_home_menu_roomlight.png": "6411f6caa63e28d722e2aae45a7ee855",
"assets/assets/icons/home/ic_home_menu_door.png": "6d7a6ee092ae90a110ddf75e3031dffd",
"assets/assets/icons/home/ic_home_feature_edit.png": "186e85e0f4c9beca6e7b3f101f2c84c4",
"assets/assets/icons/home/ic_home_remote_car_good.png": "8ce62db2e5e7047495f5ceab53fa2841",
"assets/assets/icons/home/ic_home_menu_window.png": "f1d2183fbd6c431cc5cf3a82ba72a85d",
"assets/assets/icons/home/ic_home_feature_driverassessment.png": "7b73d65d2a2d32a89b5438f8c4d7058e",
"assets/assets/icons/home/ic_home_menu_light.png": "8e1989541a6a053760679d8f3e09873f",
"assets/assets/icons/commons/ic_calendar.png": "3a7f083fcb096e56c116e1842ba2280e",
"assets/assets/icons/commons/ic_setting.png": "b5be8b086e11ee6c42af720ef7c346c2",
"assets/assets/icons/commons/ic_close.png": "0e202b6ecfb72479e4abe1129344995e",
"assets/assets/icons/commons/ic_home.png": "12d4ac4e5adc14594bb6ea6dbb2bcc8b",
"assets/assets/icons/commons/ic_checkbox_uncheck.png": "3272c2cfdd36649726f6b64e0ab9e593",
"assets/assets/icons/commons/ic_radiobutton_uncheck.png": "2e5b2e6cb8bf1960b9f6928d77214671",
"assets/assets/icons/commons/ic_back.png": "31a255f5b60fda47f7d121dbac0fe155",
"assets/assets/icons/commons/ic_checkbox_checked.png": "af84092a588b4a9a607d8e2d6eafc4b6",
"assets/assets/icons/commons/ic_radiobutton_checked.png": "d0b0008e761d607cefdde90e81b7c808",
"assets/assets/icons/bar/ic_bar_notification.png": "50a94599c15e09d5aff59ded46fb4c07",
"assets/assets/icons/bar/ic_bar_menu.png": "b40330d74d5ff8594be06b16d12d879c",
"assets/assets/fonts/NotoSans-Regular.ttf": "f46b08cc90d994b34b647ae24c46d504",
"assets/assets/fonts/NotoSans-Medium.ttf": "a1311858ffd88b69aa5eadafd8f5c164",
"assets/assets/fonts/NotoSans-MediumItalic.ttf": "c3df9f63939ae47a3f978d3fdfd8ed8b",
"assets/assets/fonts/NotoSans-Black.ttf": "a45b4647b217a27f7eb0db1f4a4a2421",
"assets/assets/fonts/NotoSans-Bold.ttf": "28c191ce33ca36e0f75106491846de68",
"assets/assets/fonts/NotoSans-Thin.ttf": "52d74c81e361a9c83871d47fe86a3c59",
"assets/assets/fonts/NotoSans-SemiBold.ttf": "f5a1e1476234ba356911d9b4e287e30d",
"assets/assets/fonts/NotoSans-SemiBoldItalic.ttf": "69f9af3b328aa8557b3c81df5ccaece6",
"assets/assets/fonts/NotoSans-LightItalic.ttf": "df8dedaaf9c464305f57eaad5d2a30f3",
"assets/assets/fonts/NotoSans-Light.ttf": "1e81ec98e0668cbee241a1f0a0ab90ad",
"assets/assets/fonts/NotoSans-BoldItalic.ttf": "5081347d3b3098e341b011b704cd4d67",
"assets/assets/fonts/NotoSans-BlackItalic.ttf": "13ac991d429a2ca6be9451e38a5079cd",
"assets/assets/fonts/NotoSans-ExtraBoldItalic.ttf": "cb45ddbeb7ca5b0c1934ce48f8a3767b",
"assets/assets/fonts/NotoSans-ExtraLight.ttf": "b4dcd4a644afea0c03cc0aacd66105eb",
"assets/assets/fonts/NotoSans-ThinItalic.ttf": "a16fd39654ea16dc249af4623b1e05cb",
"assets/assets/fonts/NotoSans-ExtraLightItalic.ttf": "e7842c55efb8a16943eabe63ad94a93b",
"assets/assets/fonts/NotoSans-ExtraBold.ttf": "6d20a0d666df4e4ed72c2f666a974ea0",
"assets/assets/fonts/NotoSans-Italic.ttf": "a6d070775dd5e6bfff61870528c6248a",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
