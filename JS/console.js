//ERR_CERT_INVALID when no Proceed Anyway
sendCommand(SecurityInterstitialCommandId.CMD_PROCEED)

// youtube fastest
$('video').playbackRate=16

//delete all elements anywhere within their text
document.querySelectorAll('yt-formatted-string').forEach(el => el.textContent.includes('My Hero Academia') && el.remove());

//show all elements width greater than window width
const query1=document.querySelectorAll('*').forEach(el => el.offsetWidth > window.innerWidth && console.log(el));

//simulate a continuous click event.
//azure devops add link modal link type combo box (dropdown menu)
const inputElement = document.getElementById('__bolt-textfield-input-32'); // Replace 'myInput' with your input element's ID
function keepClicking() {
    inputElement.click();
    setTimeout(keepClicking, 100); // Adjust the interval as needed
}
keepClicking();


//print all divs properties
const query1=document.querySelectorAll("div");for(i=0;i<query1.length;i++)console.log(query1[i].innerText);
const query1=document.querySelectorAll("div");for(i=0;i<query1.length;i++)console.log(`Element ${i}: Width = ${query1[i].offsetWidth}, Class Name = ${query1[i].className}`);

// https://status.geforcenow.com/
// open all accordions
const query2=document.querySelectorAll(".is-group");for(i=0;i<query2.length;i++)query2[i].classList.add('open');

// https://github.com/trending?since=daily
// order by number of stars
let divElements = document.querySelectorAll('a[href$="stargazers"]');
const divArray = Array.from(divElements);
divArray.forEach(div => {
  const text = div.textContent;
  const updatedText = text.replace(/,/g, '');
  div.textContent = updatedText;
});
divArray.sort((a, b) => {
  const numberA = parseFloat(a.textContent);
  const numberB = parseFloat(b.textContent);
  return numberA - numberB;
});
divArray.forEach(element => console.log(Number(element.innerText)));
//if need retrieves previous sibling element
divArray.forEach(element => {
  const bElement = element.previousElementSibling; // Get the previous sibling element
  if (bElement.tagName === 'B') {
    console.log(bElement.innerHTML); // Access the innerHTML of the <b> element
  }
});

// https://taskernet.com/?public&tags=&time=Year
// preview all projects
const query1=document.querySelectorAll(".option.previewInline");for(i=0;i<query1.length;i++)console.log(query1[i].click());

// https://www.gsuplementos.com.br/whey-protein/
// order by number of stars
let divElements = document.querySelectorAll('span.default');
const divArray = Array.from(divElements);
divArray.forEach(div => {
  const text = div.textContent;
  const match = text.match(/\d+/);
  const number = match ? parseInt(match[0]) : 0; // Handle case where no number is found
  div.textContent = number;
});
divArray.sort((a, b) => {
  const numberA = parseFloat(a.textContent);
  const numberB = parseFloat(b.textContent);
  return numberA - numberB;
});
divArray.forEach(element => {
  const extractedNumber = parseInt(element.textContent.match(/\d+/)[0]);
  console.log(extractedNumber);
});

// delete shopee ad from search results
const targetDiv = document.querySelector('div.inline-block.px-1.py-0\\.5.rounded-sm.bg-shopee-black26.text-xs\\/3.capitalize.text-white.whitespace-nowrap');
if (targetDiv) {
  // Go up the chain to find the div > a > div > div > div parent
  // This is 5 levels up: targetDiv -> div -> div -> a -> div -> div
  // Let's walk parent nodes:
  let parent = targetDiv;
  for (let i = 0; i < 5; i++) {
    parent = parent.parentElement;
    if (!parent) break;
  }
  if (parent) {
    parent.remove(); // remove the element from DOM
    console.log('Parent div removed.');
  } else {
    console.log('Could not find the parent element to remove.');
  }
} else {
  console.log('Target div not found.');
}
