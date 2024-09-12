import { Controller } from "@hotwired/stimulus"
// import { Modal } from "bootstrap"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["image", "modal", "modalCarousel", "modalItem"];

  connect() {
    this.initializeCarousel();
  }

  initializeCarousel() {
    this.imageTargets.forEach((img, index) => {
      img.addEventListener("click", () => this.openModal(index));
    });
  }

  openModal(index) {
    const modalCarousel = new bootstrap.Carousel(this.modalCarouselTarget);
    this.modalItemTargets.forEach((item, idx) => item.classList.toggle("active", idx === index));
    new Modal(this.modalTarget).show();
    modalCarousel.to(index);
  }
}
