// ==UserScript==
// @name         Time.is Auto Position
// @namespace    power.user
// @version      1.0
// @match        https://time.is/*
// @grant        none
// javascript:(function(){window.open('https://time.is', '','width=320,height=480');})();
// ==/UserScript==

(function() {
    'use strict';

    window.addEventListener('load', () => {

        // Scroll to specific position
        window.scrollTo({
            top: 200,     // adjust vertical
            left: 0,      // adjust horizontal
            behavior: 'instant'
        });

        // Optional: resize window (works if popup)
        try {
            window.resizeTo(440, 241);
        } catch(e) {}

    });
})();
