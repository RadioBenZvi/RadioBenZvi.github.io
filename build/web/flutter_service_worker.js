'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "8bfd0d89fc59cf8c5096a081e063aaa9",
"assets/assets/fonts/DorianCLM-Book.ttf": "bb7dfe9bdb231df99b884d9ef5f87b87",
"assets/assets/fonts/DorianCLM-BookItalic.ttf": "8ebd4604a3580cccf1c58b8fc5855802",
"assets/assets/fonts/JournalCLM-Light.otf": "db6f6c52c682bb5335c708a11e89d979",
"assets/assets/fonts/OzradCLM-Bold.otf": "23aca4321f77a6430edfb8e653cfc916",
"assets/assets/fonts/ShmulikCLM.ttf": "d308258efa1433d29f7819280485747d",
"assets/assets/images/logo/logo.png": "5b91671f4efdbe90b6218febff7574be",
"assets/assets/images/logo/logo_small.png": "12a1bf099078090f44f542995f888b3d",
"assets/assets/images/logo/logo_very_small.png": "4aa1b54f85b83a05aa085937f1c54fc1",
"assets/FontManifest.json": "075fde73ce9eb6bf27776c3ecc77bfe9",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "3209c2f9ca70d58f289dcded4420b342",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.ico": "35054abcd7d2ab67018c0c698cc2d212",
"flutter.js": "0816e65a103ba8ba51b174eeeeb2cb67",
"icons/android-icon-144x144.png": "344abc6c0a20cebf71f46730ace1e7cd",
"icons/android-icon-192x192.png": "657913b151ca6b7b835c4934361626e5",
"icons/android-icon-36x36.png": "93438069c888a9ab955feaa7a33e97fd",
"icons/android-icon-48x48.png": "e4c695302c067c64ed6cb1ebcde10a02",
"icons/android-icon-72x72.png": "fed4f18424186702aeda27da20895f60",
"icons/android-icon-96x96.png": "be491d8dd0891ec9d1bf9ea87e650279",
"icons/apple-icon-114x114.png": "da52167e3b51b40055ee6c70069ce9da",
"icons/apple-icon-120x120.png": "bbccabac49fcf5cf9d1e348959d4ba4d",
"icons/apple-icon-144x144.png": "344abc6c0a20cebf71f46730ace1e7cd",
"icons/apple-icon-152x152.png": "7fb588d2f82786f9711f10fd5d9a2931",
"icons/apple-icon-180x180.png": "7872ed09b2a38de05dc48cc7ec52624d",
"icons/apple-icon-57x57.png": "a2a7bbf81bb5ff6629073cd46da90ce2",
"icons/apple-icon-60x60.png": "6de832209dce8e4ea95e2c9db640bb7f",
"icons/apple-icon-72x72.png": "fed4f18424186702aeda27da20895f60",
"icons/apple-icon-76x76.png": "8f2ff145b1963cc4283c82d210084388",
"icons/apple-icon-precomposed.png": "9ad9a9e716b0edeb4b832857616366d1",
"icons/apple-icon.png": "9ad9a9e716b0edeb4b832857616366d1",
"icons/favicon-16x16.png": "67e39e782d7426617b01f1633832a0a2",
"icons/favicon-32x32.png": "298db83f7622d4d11b54a56e58d5a901",
"icons/favicon-96x96.png": "94d21595650c6c5917191ef34a0de3fb",
"icons/favicon.ico": "35054abcd7d2ab67018c0c698cc2d212",
"icons/ms-icon-144x144.png": "344abc6c0a20cebf71f46730ace1e7cd",
"icons/ms-icon-150x150.png": "ff9f7efb4e036eece58263da8cb4b398",
"icons/ms-icon-310x310.png": "4011ddc7a46d3b9132bf34bcbe943bc9",
"icons/ms-icon-70x70.png": "85fb0cf4469bfcccc5e1851aafa2b44d",
"index.html": "e55177e21315c025f359b53ec7ee4919",
"/": "e55177e21315c025f359b53ec7ee4919",
"main.dart.js": "ed9fac05eb9c6c14dfca10179f97976d",
"manifest.json": "9d63757af368f9cf8511459e042310e5",
"version.json": "da94e950d985f6f6a53ca17dbb7e35b1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
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