importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");

const firebaseConfig = {
  apiKey: "AIzaSyCTy99RPZZGak6ckrH_2vUKHh5eaCbs55g",
  authDomain: "efotball-8e3d2.firebaseapp.com",
  projectId: "efotball-8e3d2",
  storageBucket: "efotball-8e3d2.appspot.com",
  messagingSenderId: "732744668889",
  appId: "1:732744668889:web:a42fec17aeaae0026410c8",
  measurementId: "G-005Z2LFBLR"
};
firebase.initializeApp(firebaseConfig);
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});