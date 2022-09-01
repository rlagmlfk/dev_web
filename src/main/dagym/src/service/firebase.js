// 파이어베이스 공통코드 
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.9.0/firebase-app.js";
const firebaseConfig = {
    
    apiKey: "AIzaSyAJUd-i9rP8jdDsyLOBt5_tk7oYvckByKk",
    authDomain: "semi-projet-e58d8.firebaseapp.com",
    databaseURL: "https://semi-projet-e58d8-default-rtdb.asia-southeast1.firebasedatabase.app",
    projectId: "semi-projet-e58d8",
    storageBucket: "semi-projet-e58d8.appspot.com",
    messagingSenderId: "174296285860",
    appId: "1:174296285860:web:1d2fd5bf6f5f1fc3fd5c31",
    measurementId: "G-36HEEGVCMN"

};

export const firebaseApp = initializeApp(firebaseConfig);
console.log(firebaseApp);