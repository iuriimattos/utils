// youtube fastest
$('video').playbackRate=16

//delete all elements start with text
document.querySelectorAll('yt-formatted-string').forEach(el => el.textContent.startsWith('My Hero Academia') && el.remove());

//show all elements width greater than window width
const query1=document.querySelectorAll('*').forEach(el => el.offsetWidth > window.innerWidth && console.log(el));

//print all divs properties
const query1=document.querySelectorAll("div");for(i=0;i<query1.length;i++)console.log(query1[i].innerText);
const query1=document.querySelectorAll("div");for(i=0;i<query1.length;i++)console.log(`Element ${i}: Width = ${query1[i].offsetWidth}, Class Name = ${query1[i].className}`);

// https://status.geforcenow.com/
// open all accordions
const query2=document.querySelectorAll(".is-group");for(i=0;i<query2.length;i++)query2[i].classList.add('open');

// https://github.com/trending?since=daily
// order by number of stars
let divElements = document.querySelectorAll('a[href$="stargazers"]');

//if need retrieves previous sibling element
divElements.forEach(divElement => {
  const bElement = divElement.previousElementSibling; // Get the previous sibling element
  if (bElement.tagName === 'B') {
    console.log(bElement.innerHTML); // Access the innerHTML of the <b> element
  }
});

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

// https://taskernet.com/?public&tags=&time=Year
// preview all projects
const query1=document.querySelectorAll(".option.previewInline");for(i=0;i<query1.length;i++)console.log(query1[i].click());
