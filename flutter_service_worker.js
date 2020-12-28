'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "786d7ac5462548b27569ee988dac3372",
"index.html": "0c2fcb4d0521aa487b023666c14fa891",
"/": "0c2fcb4d0521aa487b023666c14fa891",
"main.dart.js": "cb80009a6209b25ba2a56ac92d8fce46",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "01c134b433696b783a075df23518d046",
"assets/AssetManifest.json": "6c5a5da24ac03c06efb720dcbec59459",
"assets/NOTICES": "730778ebbc56e1d54cc073cd14065d53",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "d80ca32233940ebadc5ae5372ccd67f9",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a126c025bab9a1b4d8ac5534af76a208",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "831eb40a2d76095849ba4aecd4340f19",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/data/renault.png": "617741dba292cfcd6a23a7c2fc0be8f4",
"assets/data/ford.png": "0938645a47a34c03d9e98eff36ad7d87",
"assets/data/lexus.png": "2115ee933c50b44eeb112d03dddd94c2",
"assets/data/saab.png": "5e52e1b0a91e2c33f24279be4d150276",
"assets/data/hyundai.png": "975e5b812ebb46d73ed9d0d1ffcb905b",
"assets/data/iveco.png": "64bd9309fc64deea5b58d389dc7bf368",
"assets/data/peugeot.png": "cef132001fc2e86f83dded534e09829f",
"assets/data/chevrolet.png": "6bacb2b72d313c9c2251b519741a5161",
"assets/data/seat.png": "92eb3a7a9cdc71ec674b487637b334ca",
"assets/data/cadillac.png": "9a1af8513eb6933ddba8db7087208be2",
"assets/data/mercedes.png": "0e391ef78dff1ef5b51c92251bd6c21f",
"assets/data/buick.png": "bc11d23163be799f74744da013f9a807",
"assets/data/skoda.png": "1009a6ab2e4b3c08dfbeddf60ed6eea7",
"assets/data/fiat.png": "af50d7731f64a3420756223dd5e7140e",
"assets/data/pontiac.png": "a3a9033637aa24d99e2d79492c813297",
"assets/data/volkswagen.png": "f2f5749943a2abb285ff3b43614a981a",
"assets/data/smart.png": "f95dd83a27cd779c45927d9ad3fa45de",
"assets/data/acura.png": "96b21ff3408cd6e1ff30442c93e9159b",
"assets/data/volvo.png": "6f21e51151af514952980742ea01e780",
"assets/data/land_rover.png": "770a113537da3fe1f6764fc7e7d730d5",
"assets/data/dodge.png": "5361615a858c7d2d1c88f689d9a90c64",
"assets/data/toyota.png": "af0f94bdf2d5d3cc6f0397ac064e2f4d",
"assets/data/rover.png": "3643990fd33db78cb604f845045f06aa",
"assets/data/lancia.png": "159da389cb9b2dc21097ec5b2e9256d5",
"assets/data/data.json": "b86c0e2b05d954481f48fe43e55952db",
"assets/data/audi.png": "8c54cd3cbd1746bcb44f42b3dcc6e0f7",
"assets/data/honda.png": "d075546f2322dcfcb7be7ec9b1b5f624",
"assets/data/chrysler.png": "72e6b635598475f249024fea268a002d",
"assets/data/alfa_romeo.png": "260a4f428a75afcfc9cd57d78b14a023",
"assets/data/subaru.png": "7fc765dba35f13a24d26c98d2c1e9294",
"assets/data/mini.png": "50cceca1fd243d53cb2ae51be96a4775",
"assets/data/daihatsu.png": "3052fa6b3646350a6137fd3f53c6bc72",
"assets/data/citroen.png": "a2b8cd4a02ff1ff57ca64fb777f3023b",
"assets/data/isuzu.png": "b1d3901f13cb79453827196fb50f7191",
"assets/data/ssang_yong.png": "104d5a8b431be53df7452db368d51b8d",
"assets/data/mitsubishi.png": "963171ff6f776de991e6c67686c76543",
"assets/data/kia.png": "de8a675a5371761f5f3eeedeb5913462",
"assets/data/porsche.png": "b699a1c4202f581684cd9d04477bed69",
"assets/data/brands.json": "b1331f1b5aa414f92845020bb0165918",
"assets/data/dacia.png": "c3fa161f233d400137fa8d757a6206c8",
"assets/data/suzuki.png": "4a999046c4225a6941fe739d93d587b0",
"assets/data/opel.png": "9d514285ca785f02982af442fdd63a37",
"assets/data/nissan.png": "ff1447e79a8a7b2820a3a4e7802c9614",
"assets/data/jaguar.png": "5efd0e5bce61b46b1a94132559e83336",
"assets/data/infiniti.png": "b72b07874f8634ceaeaf448ab012b5a5",
"assets/data/mazda.png": "f090cd0bc1890c9bad76197fc96a48e6"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
  for (var resourceKey in Object.keys(RESOURCES)) {
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
