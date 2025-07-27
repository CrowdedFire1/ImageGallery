
document.addEventListener("DOMContentLoaded", () => {
    const modal = document.getElementById("display-image")
    modal.addEventListener("show.bs.modal", display_image)
});


function display_image(event){
    const display_button = event.relatedTarget;
    const url = display_button.getAttribute("data-image-url");
    const altText = display_button.getAttribute("data-image-alt");
    const titleMarker = document.getElementById("title");
    const marker = document.getElementById("url-marker");
    marker.innerHTML = `<img src="${url}" alt="${altText}">`;
    titleMarker.textContent = `${altText}`;
}