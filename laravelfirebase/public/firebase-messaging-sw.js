/*
Give the service worker access to Firebase Messaging.
Note that you can only use Firebase Messaging here, other Firebase libraries are not available in the service worker.
*/
importScripts('https://www.gstatic.com/firebasejs/7.23.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/7.23.0/firebase-messaging.js');

/*
Initialize the Firebase app in the service worker by passing in the messagingSenderId.
* New configuration for app@pulseservice.com
*/
firebase.initializeApp({
    apiKey: "AIzaSyCqK-lu791n7yNkqx354V2yMsiyubrq3CI",
    authDomain: "fir-web-notification-49d1e.firebaseapp.com",
    databaseURL: "https://fir-web-notification-49d1e.firebaseio.com",
    projectId: "fir-web-notification-49d1e",
    storageBucket: "fir-web-notification-49d1e.appspot.com",
    messagingSenderId: "675230873830",
    appId: "1:675230873830:web:4e0a1f27932dba85dd2327",
    measurementId: "G-2NG9ZC0DMY"
});

/*
Retrieve an instance of Firebase Messaging so that it can handle background messages.
*/
const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function(payload) {
    console.log(
        "[firebase-messaging-sw.js] Received background message ",
        payload,
    );
    /* Customize notification here */
    const notificationTitle = "Background Message Title";
    const notificationOptions = {
        body: "Background Message body.",
        icon: "/itwonders-web-logo.png",
    };

    return self.registration.showNotification(
        notificationTitle,
        notificationOptions,
    );
});