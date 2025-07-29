document.addEventListener("turbo:load", () => {
    const modal = document.getElementById("display-image")
    if (modal) {
        modal.addEventListener("show.bs.modal", display_image)
    }
});

function display_image(event){
    const display_button = event.relatedTarget;
    const url = display_button.getAttribute("data-image-url");
    const altText = display_button.getAttribute("data-image-alt");
    const titleMarker = document.getElementById("title");
    const marker = document.getElementById("url-marker");

    const image = new Image()
    image.src = url;
    image.alt = altText;
    image.className = "img-fluid";
    image.onload = () => {
        marker.innerHTML = ""
        marker.appendChild(image)
        titleMarker.textContent = `${altText}`;
    }
}