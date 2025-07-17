'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "6f6d188e80a24735ed3c56be4b736ee8",
".git/config": "a3c61a8c9468ec0ab1475ced98b4898f",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "5f9c816d66631886096cd299191a57e3",
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
".git/index": "129d5c4a7c742259fc7b320f5d023c6c",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "dc0532a3f47c004584863a6771a7bbc0",
".git/logs/refs/heads/master": "dc0532a3f47c004584863a6771a7bbc0",
".git/logs/refs/remotes/origin/gh-pages": "835125f6fdde69cf281e3f361107cdf7",
".git/logs/refs/remotes/origin/main": "6542d289af0a19b9dc6d325293a54874",
".git/objects/02/25d66c646c2e8a921717415b852ab24dd974b4": "4d1a3c04e92b31f420e82f10c6beee60",
".git/objects/02/f3abefbd17159a5411e160352c3f575a2fc2c8": "48c04be817f03eed84c062430cc4741b",
".git/objects/05/2021bfdf0ba3913bba1e87910b634f3c508353": "d1cfbf3bb74b42603516d09efb4b40d8",
".git/objects/05/cbc8e36aafbf2748f1eaa3e7e03988dc8919ed": "67c9b69d407ffedac177d86953e83115",
".git/objects/0d/2902135caece481a035652d88970c80e29cc7e": "dfc8c4c4b7d0a1b6dbadc04d9fa6e6f1",
".git/objects/14/064066ffb3f2afdc72711b18cf5d2a62b04451": "9d10be841455c7c3b6e3ea917c2641ae",
".git/objects/15/3653e8d67f81b901d28257a65908f3278e058d": "753c81a6f016d29eb4605decbac41935",
".git/objects/17/674712f36868a3cc98b3c01a6f30ae18878f8d": "6131f4e557def861c1863fb3e4d57f1f",
".git/objects/17/797f893634f4da855e58a6b064baffba94e780": "d8906e77d5d70e3f8b0539e0a0bdedb5",
".git/objects/1a/4380284b4d0ba76f46158e3011dae2d58978aa": "0237c8a3226c2ee2217222c6acdfa737",
".git/objects/1f/e3a52517634447ea79dad0c3f20ba900a4a16d": "952d5146dc883044732abd71be5e59f1",
".git/objects/22/462148d5ee4dd2f9b311286ff34755d319729f": "2c7f28af233c7589ecda0ec9bc934e59",
".git/objects/22/b998d954ca5f9c8e9ba1a709f2b5502d6ad297": "4767e24e5ed5d7082d21777da5d779e5",
".git/objects/2f/ba16aeca1b62f1d220b8fb4245ecad13b375ff": "c3de21b9c819710e19f0b6f9e2abd1bc",
".git/objects/38/79d54755798567f0f318d63340508d5668eb96": "cfe50cd405acbf1c250baa58cfe6b9ed",
".git/objects/39/4917c053a04daa76d8b94f0a02db0bd99e1034": "bbdd537b090d83597a791f77deacff5c",
".git/objects/3a/0b46511a71b464dac72d693faae6ea0f7e3b2e": "351d4fd0e3a9a4bc304d0a579290669b",
".git/objects/41/dffd916c819ce639f0636e55bb4082214acca3": "34adfc33311d3bfdfe5547bb15f7b79f",
".git/objects/42/5951b3681e8d5d894a2bddfafa74fd30f65cc4": "5be02bc3ac3dabe8bc8ef6a27597dfd9",
".git/objects/43/551b1dd60ceb939c76a4f8cb60b68e8379019b": "fe0ab97fca87f606268a8c061187057d",
".git/objects/45/a6ad3b3dbbbaf00710641a779468e1b8999fdc": "95baf95c19cc46ca8798c8d66a307361",
".git/objects/45/be7b6f7c1ebd3a5a4fba5db0f2e31d5395c64e": "78df5f8ae21879e4a6ab9accfe121c83",
".git/objects/48/e82a24bb4b9bdcc46423f3851d13d7dfe41b36": "e33b44ebb86ec7b071bc0be02404073d",
".git/objects/4a/896bc9819fb532fb12e8ee217de889719a4dfa": "9e70765c39634fcd4d451d76455e1d8d",
".git/objects/4f/badd9470cc87e3f8249dff5aba9e5c03a0871b": "1c2bf690d4f95790b63b0cfb1df16bcf",
".git/objects/53/dd9abaf17e45492510e2278552aa74ee15b010": "e2d4c2dae3a80a4283e943115fb468c2",
".git/objects/55/7a17678cd523f47b446a27eee307e0a574a51c": "7a1aec77c20aed14e00a00cb99d34e47",
".git/objects/5d/00e3579a8f7dbabe2b340a46c826527a705ef8": "a4834cac57d2bdedc0cb3c4bf912b82f",
".git/objects/60/608d0fe5bff3a7a7e05d5a232944a1a8effe5f": "e213f83927c2a4c19aa1b864a19eb852",
".git/objects/61/48260eb72203bcff11ca5c00b7f27525409528": "3a9d6ba827ff35401d525d9fddb1d866",
".git/objects/61/8362825a392a4f0a4ab66cbe3fbfecae0f64a7": "ea4ac2fc26e6d8a7ad5800f9c0d43870",
".git/objects/62/2fe1aed99893804647827fd79635384b27a0b6": "c8fd8e2a4c724f49b60959634af0f98a",
".git/objects/66/a65d1e4a79f230031ec0e0959a721039e7282f": "2a87e723b46c44522c16c0968efa0152",
".git/objects/6d/a0652f05f28fc6950cec20ebdfbae89b665479": "fccd5f0f0fbfe5ead1a5622148fb8d74",
".git/objects/71/b39c9104678fb76f3e452e0de971618619d376": "7f63cab563f3b2030c44abf854448064",
".git/objects/74/50ed83ae23f0d1dd04a933f34300346ba4ddd9": "eaf20869f6823566c136bd5e7be786ff",
".git/objects/79/c113f9b50178eefaedb999950fa206eaf6d645": "0a062ce1fa85a99ed952de77de2c04ee",
".git/objects/7a/a5498c8441bc7f7767054b789df8dc7e353c2b": "a0a5c63328e57bafe308ac1eeb2abf4d",
".git/objects/7a/b635b7b2ac14f4fc86e3dc4e97c94d082d991d": "d866926cf8426360f21d37a738bae1db",
".git/objects/84/f463f64ad1ce5fc699c200b266d49b41f37d5a": "868925f85bc9f18038cfa7948279fea0",
".git/objects/86/38c9cf24c0cc92ed953eb00a66e6d26c0ee1c8": "684614363d1dd8e42855d6eb2f6e3907",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/6d4680af388f28db8742ef7fb8246e2bb1fffb": "4e20d4660135ff8d41852fa5b986bfb5",
".git/objects/8b/d06bdf095c809f80d639847440b06b0199a88c": "58d6dcf8e95c016f9f2dd6468f1fcdf1",
".git/objects/8b/eb52d369b90b380c188f435344cbf987298d1f": "c410a380db38022da2119f71437bb3a8",
".git/objects/8e/117531ac0a0c4f6e2f1c698558e2812e63036b": "6c43f3c3978238feab2dcbc3e34c2175",
".git/objects/90/3f4899d6fced0eb941e159f7322b21b320c40c": "83b7d85886d6c364db4cef0543e046ee",
".git/objects/91/95816585fd5f3e504d056aec08c4bf4d40706e": "80714060a089c2630abd6aef798e2c67",
".git/objects/91/bcbe2cff56f6919c324bd477c2c7b2e913eec0": "84774aeb05b2ff8af6fb25b3dc20e77e",
".git/objects/95/5ee3038f988929fac2dedb6a307ebd45dfcfd7": "84f4c0c3560baa9920ae37a5e8144c5e",
".git/objects/95/c6f8c53274c19a2b017345084597643d9f031e": "fa148d1617e6800948b16855bb7f78cf",
".git/objects/98/bfe237519a359ca101858bc63e19ea636e2acf": "42d8a346504b6705bfe7b1661bd52479",
".git/objects/9e/d9536e3a917573969dcdd8f540531167378d49": "9f11c77f17fa12fc837b5930617ac31f",
".git/objects/9f/5fd9879c42615e644e3ce4c63238342c3a83b2": "6d54da325424ba27464a5eea87ea13a7",
".git/objects/a0/eb2cce86c8c28113929651b4d3cf6f550ab56c": "ad7e8d1dba594e59a5d7e957e74585ab",
".git/objects/a7/9c381fadf7cdf0aef12e2c8cd8c465810aeac1": "b531936ed9b4fea75e8107879ee2bd15",
".git/objects/a9/79fcb2914c608d967db12198ba77b91b3f5de9": "57fea6c223d510310aba8a3ee21385dd",
".git/objects/a9/c770d665110994c711bb3438140708462735d1": "dcd931a8c02e2aaa7d5c053367fe914e",
".git/objects/ac/b0570ffec39213be4da07f779694c98bd6c49e": "965b87c0a1d2addafaf0901e903a9b8c",
".git/objects/ad/9ca1266149bf8007bdec797aec81af73ca4a66": "023dc4f2d85b52293f8540fc9a57bc55",
".git/objects/b0/80a7849240cc62b5f5fa684086e70739ec285a": "c3be1210910bc276bea1ff5c6c4153a4",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b8/58bc2a3edac595b7ded6442d02a65b94381cdd": "4d8a838b099b97c680d50db8e81b0cc2",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/3c4c30c16703f640bc38523e56204ade09399e": "d81d171c0590dfeb78e8d6c404330bb1",
".git/objects/bb/13f987012cd0a7da7e855a02d6c4be5d31e0c5": "4560ca72abb8fc671552d9acca533b95",
".git/objects/bb/8207ccfc62fb30ca7553a6c1cbb9b298aece54": "bd0795a4af0d7a95fe65dd54a190f52c",
".git/objects/bc/9606b5d236d8a66ef3a9713bdcacdd793aa4e0": "adb35a714eb6b35228c330b159437e2b",
".git/objects/bf/ac543154dde4754e909508069f03d813a9b7b6": "c605eb9bdfeb9865dadec0e7f1cfca09",
".git/objects/c0/4e20caf6370ebb9253ad831cc31de4a9c965f6": "5e216dece9f226a4ac045363fbbe142a",
".git/objects/c4/4caef13445b1a251643e653fc26dc40ba78eb0": "65e07e9515cb93f104b9ab917d14f001",
".git/objects/c5/30348f96773bc6695615e5320c9c8fd62d2c3c": "a48ec2c8da9910c26bf73a7e39bdabec",
".git/objects/d0/da8636a72cb756ce6bbca44f6997631f12474c": "380a250bedf0e420528a7959de0ef7d9",
".git/objects/d2/d2608cc169d46f9492e9baa820c912d1a18434": "241611c2b6a004d1cb06413bfe51f432",
".git/objects/d4/92d0d98c8fdc9f93ad2543bb4f531803e9df72": "e3677ae8914304b8340d8db27e7db71a",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/dc/139d85a93101cc0f6e9db03a3e1a9f68e8dd7e": "c815b8cd55031858470b95979194ad21",
".git/objects/dd/2b916b47601d11d5a19e2d89ac04cc2f60e20e": "c196269e9d2980b3bb229599b9314909",
".git/objects/de/9388dc717bb4292ef188431d1069f4991b3207": "ae458a17eed57a27cdaa3e78ab2ea4e6",
".git/objects/df/ea20fab169db7cec3d0b0dfb7e12709855f9ea": "2ca8b2634fa4b6f4d60c376925859e75",
".git/objects/e4/d3f0dbd275346d0c3c8d1dd3c115dde2438df2": "e7b9c10abf9939eb9c590a538eef694f",
".git/objects/e5/7415426361d3a8210b2cc0c5e40e4964d548e0": "75bb3e60ea78f8065deea5cf3fb8e681",
".git/objects/e6/ec0e9f65c267fa7bf94de1bfc99dcc79daa28f": "7c2461e56f415daefd3fc4f9a1e3854a",
".git/objects/e7/2cdd7bfac1ab116673459bed7cf57cd06554f2": "7b3b0493db49471a5311fdbc505d0ad0",
".git/objects/e8/6ae4dda491b936392a8f7bc1e3481fa6b855c6": "0de38ed1a659d58fbea462dac958d68e",
".git/objects/e9/01dde684ea8ba25c50ea5dc7d5900da31a30d4": "8688207d9bdc19977b061c06f0972db7",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f1/77b0bf211d3199e7a53757170842d5c0878aa8": "d7bfcaf182f4812926be8fb53c8f4e9c",
".git/objects/f6/14469673c3f9e94b9ba86df390195394df089f": "6cccbf24e14dc5aa7f72cb7f8d18005d",
".git/objects/f8/63fffe7c010b6476417d3082d839605f01b6bc": "978953445838a6d187a059318d72494f",
".git/objects/f8/9b4004d102bc42a02452aec3ad58b25ea5ec39": "7e7d822cc3f3e69f76f6df10c036c67b",
".git/objects/f9/b303465f19b5fbf5ec669cd083c9cc38ecda9a": "ebb8d99ac52f40036a2f65e1af95e003",
".git/objects/fb/0728e040921264d2fc1e55d4c08d5e191cd1a6": "d8524deda4aa0f64d70a2e01631995c7",
".git/refs/heads/master": "fbaf1c7f023ae8f24d0836a8ef199408",
".git/refs/remotes/origin/gh-pages": "fbaf1c7f023ae8f24d0836a8ef199408",
".git/refs/remotes/origin/main": "6100041b055f24235527c0d2968cc1db",
"assets/AssetManifest.bin": "0b0a3415aad49b6e9bf965ff578614f9",
"assets/AssetManifest.bin.json": "a1fee2517bf598633e2f67fcf3e26c94",
"assets/AssetManifest.json": "99914b932bd37a50b983c5e7c90ae93b",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/NOTICES": "7444c50943fe9887012fcbeece84bea3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "e3cc169dd15213381373db1f9ef39f3e",
"canvaskit/canvaskit.wasm": "5a48c3461a11f40f5cc2e152558af3e7",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "8fce22f4d72ad11f225a4999cd247660",
"canvaskit/chromium/canvaskit.wasm": "79d736074b25feb64730127812c13239",
"canvaskit/skwasm.js": "4087d5eaf9b62d309478803602d8e131",
"canvaskit/skwasm.js.symbols": "ffc07b382ae1e2cf61303ec4391ea4ad",
"canvaskit/skwasm.wasm": "11199b1ab0318df784d266b683cf5b5e",
"canvaskit/skwasm_heavy.js": "dddba7cbf636e5e28af8de827a6e5b49",
"canvaskit/skwasm_heavy.js.symbols": "b68a224b193a61133813a90fe58898a6",
"canvaskit/skwasm_heavy.wasm": "126e7cd71ed5dc8161d5210ee14db260",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "2a09505589bbbd07ac54b434883c2f03",
"flutter_bootstrap.js": "4b1caef9ecb215ae2a98abe1cdc34007",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6d2f83dc7f4d7feb1c7a6f4f63937069",
"/": "6d2f83dc7f4d7feb1c7a6f4f63937069",
"main.dart.js": "29d971133a66873e98b4ac5a7ee6ab63",
"manifest.json": "1645a70acbe3b95fd19c6b8c5edfdcb9",
"version.json": "4c7954d6dbb62c8bd768a7a844e03513"};
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
