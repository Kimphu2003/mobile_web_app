'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "cd1ac3133e58cb8f871f99ff739aefee",
".git/config": "85cdca0fa67b920369283c05f2e12ee5",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "ceae50fc30619876873a9216dec9b220",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "d070d104887d5288ee0cbfb21b73deca",
".git/logs/refs/heads/master": "d070d104887d5288ee0cbfb21b73deca",
".git/logs/refs/remotes/origin/gh-pages": "7a07fb5e6c16da30cf081ea9f4762e63",
".git/objects/03/08bd425d72524b12df0715c7c353ef0425d860": "a34f5b334c06e7047268e1016468d407",
".git/objects/06/3ab00ef2873887493a02506f4d4807d379765f": "d77e957279fb2919fb213e52307c412c",
".git/objects/0c/8af679569da2765ce0f75414b31365d1b73c8e": "2fb35770341551a1868fc10e8f5ea700",
".git/objects/0f/e7c53420b57494d53e20e429741f1e8e0ac46d": "a834853ba93b97cfa8c4a3489ee0c6cf",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/20/dd54bb796031d2e521df3852eac8c148ee4b74": "dfb0a1debde4b33ae26f403ab243f29f",
".git/objects/28/2f903cc8b7fd4e5f6a24e9697daa1773265b5f": "cd52192323fac8fff361a6471b7c057a",
".git/objects/2e/408c1b5223ed1581d2565d6aff2cd4657241fc": "74e72ddefcfdb6e0503fe000820043b5",
".git/objects/3f/4eb2e04c976f3a1620d23859b452fc2a2db824": "98f561c9af2aa7667840f8e8b18a965b",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4c/51fb2d35630595c50f37c2bf5e1ceaf14c1a1e": "a20985c22880b353a0e347c2c6382997",
".git/objects/51/ccf609680c4fb4c16ad26100e744273ba82c04": "45c39b4464382dc104e6d1edb7e1979b",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/54/6657f6d35e1451a32f610636373f85fb105575": "54eccfb6882d2169104dd3e3a5d2599f",
".git/objects/56/ac3d1b4dff693105d0a90bbf115729fc7e15c9": "9cdd475977efa6d65a960fcd5439bd0d",
".git/objects/59/6dd6dedff038010afb495bfb7df0c622d580bc": "29b04a3c3416822a34cab436c1437091",
".git/objects/5a/dee2acb7e5bbe76b26f53a27cda50ffa79cd73": "5b5d07be01a5a71010567fbf4aa6142b",
".git/objects/60/183d4efd9a73b3cce23a7eba74052d7b87349c": "fe8b8d09741b5177b32da45ffe8f7b4e",
".git/objects/61/cef8108ee1b510a3c998cbb90a2918259460df": "7a48afe85a8cc436477591fbb2693be8",
".git/objects/62/979ae5b8554634b82372760c6c4aa5ca3dd7f8": "9ac169206edaf64a8bde54d4fd0b2edb",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/75/d8e39e4bbc1a0c92a12779a9351ca9dadbe8b7": "626dcd0147963d92556c7efbe3f46cff",
".git/objects/77/6cfcf2dc74b6cf17b1326dff9c1aba572692df": "1065338dc7fbf45b4e35b0cce73cf14a",
".git/objects/80/a7d54b406cc0c7e4be8aef4653cadfba7e4d56": "fb633ef2e7e9595412e3388850bb5a96",
".git/objects/86/ddc40f5023989aa633985b5a932061667fcb28": "1cdee34d1d5b41426637239c1a0fec5e",
".git/objects/87/485fa8f708e0c6668557e1055fe60c4cf77d14": "712643467d3bfb09aebc07cf86cf48ec",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/3c7d6bbbef6e7cefcdd4df877e7ed0ee4af46e": "025a3d8b84f839de674cd3567fdb7b1b",
".git/objects/96/a8232f94bd62d43774e768cc215cc2185fff46": "ef6e19781d7657c02501515e696627fe",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/9e/d6245e4bb5d5485c13c31a0a3e719612c5dc32": "592ce8fca40b3fb144fe2ec22d8d952e",
".git/objects/b3/1e9d65bcd0f83b83c5f71947adb41ae875282f": "8cbb9eea9c5fbe2a527a4d6d284bc7e3",
".git/objects/b4/9e61346a5bfe78f5d32f9e10ef218dabd783b1": "92d79f39ea0a098b5a30c1e6d6a9f003",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/c6/d65110a0a6f34634d1b2ba08305df1079b485b": "34aea13bc4e7247a64cd1645142b532f",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/c9/13ccbf6431807c96faf18778181c190b6ff59d": "d97b6bc0431068885f98c56e091b3a8c",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/e9/198645f88ae7f8b68c80bc8d84b788e3ff713a": "79f7bf4c35a45d1f92c860fba0fe56d5",
".git/objects/e9/1de9221e4ff34ad39e824888c98f77f8fd35c1": "57625401c9dfeed11bc2a7c512f6cf9f",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/ea/dd042d15f28837ab37c4bcdccfcc75283f3e64": "73bbf0d930fc6c70ffac7869585fe98a",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ef/5feb34b135e08ab90be7165e69fb128a6fa628": "0ffacd8bacab4c2d409d64299ea865ea",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/3b1f3c2c64ee083901344b4a24b53f4a0bb2c4": "56419513b2c52c1852255ffd9e43e5c0",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f8/15fa2c8d849aa6ad320e3f5cd71b120cc01b15": "0e22faea769d291ea7f395dad3ba5803",
".git/refs/heads/master": "9ecb81a508d6ba359e92077889cf381e",
".git/refs/remotes/origin/gh-pages": "9ecb81a508d6ba359e92077889cf381e",
"assets/AssetManifest.bin": "789fd39ddb2548c0b6b12573ecec40c3",
"assets/AssetManifest.bin.json": "6a3bd69faf1fc3389e737d40337e5fcd",
"assets/AssetManifest.json": "86786ebb63ec337bc0c61f19591593ba",
"assets/assets/audio/audio.mp3": "d02f49f2ddb7147f0c54b29825115dd1",
"assets/assets/images/bg.png": "7d76f16804af7f60b0a0d0263e634f0c",
"assets/assets/images/dinh_doc_lap.png": "92e35d3a988d1ab315d6314b3825eba3",
"assets/assets/images/home_bg.png": "73d2fa2581526e6135a9b4107edfb097",
"assets/assets/images/pic1.png": "f7f5424ff3015461f661b69f0a440158",
"assets/assets/images/pic2.png": "c1e60c7b432dbc92a1cad40b09d9e18c",
"assets/assets/images/pic3.png": "587c0aea6987a99115caebd68ffa5c2b",
"assets/assets/images/pic4.png": "103c0e5c4fc8598667d92946a107c72c",
"assets/assets/images/pic5.png": "bc66b871b8465279c025e9f101603e35",
"assets/assets/images/pic6.png": "52c651f5976bd44ec1cc444685e94133",
"assets/assets/maps/map_l1.png": "75efb43b7207e74d16c099fab8149147",
"assets/assets/maps/map_l2.png": "c825999f04fcba633165116b5cbe683f",
"assets/assets/maps/map_l3.png": "b7707213122c15ad74107a266ed289b0",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "52ffe28279d841808e3a0c2cc72b90da",
"assets/NOTICES": "2c6a16ed156c47aae489bdf73b01dd38",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "a1238f1e3b164ef08eeca85624a925e5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "0137961312fa5e8baa03a59b2c822b85",
"/": "0137961312fa5e8baa03a59b2c822b85",
"main.dart.js": "ca00d8eeed1ca24c2e90ab81733fdd71",
"manifest.json": "1b0d9df796646fa08151fe29f0136995",
"version.json": "d0981cd273436720afa525de2a2deddf"};
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
