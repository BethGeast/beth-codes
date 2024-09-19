import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["image", "modal", "modalCarousel", "modalItem"];

  connect() {
    this.initializeCarousel();
    this.syncCarouselsGigbuddy();
    this.syncCarouselsDogbnb();
  }

  initializeCarousel() {
    this.imageTargets.forEach((img, index) => {
      img.addEventListener("click", () => this.openModal(index));
    });
  }

  openModal(index) {
    const modalCarousel = new bootstrap.Carousel(this.modalCarouselTarget);
    this.modalItemTargets.forEach((item, idx) => item.classList.toggle("active", idx === index));
    new bootstrap.Modal(this.modalTarget).show();
    modalCarousel.to(index);
  }

  syncCarouselsGigbuddy() {
    this.modalTarget.addEventListener("hidden.bs.modal", () => {
      this.cleanupModal();
      const activeIndex = Array.from(this.modalItemTargets).findIndex((item) =>
        item.classList.contains("active")
      );
      const mainCarousel = new bootstrap.Carousel(document.getElementById("gigbuddyCarousel")
      );
      mainCarousel.to(activeIndex);
    });
    this.modalCarouselTarget.addEventListener("slide.bs.carousel", event => {
      const mainCarousel = new bootstrap.Carousel(
        document.getElementById("gigbuddyCarousel")
      );
      mainCarousel.to(event.to);
    });
  }

  syncCarouselsDogbnb() {
    this.modalTarget.addEventListener("hidden.bs.modal", () => {
      this.cleanupModal();
      const activeIndex = Array.from(this.modalItemTargets).findIndex((item) =>
        item.classList.contains("active")
      );
      const mainCarousel = new bootstrap.Carousel(document.getElementById("dogbnbCarousel")
      );
      mainCarousel.to(activeIndex);
    });
    this.modalCarouselTarget.addEventListener("slide.bs.carousel", event => {
      const mainCarousel = new bootstrap.Carousel(
        document.getElementById("dogbnbCarousel")
      );
      mainCarousel.to(event.to);
    });
  }

  cleanupModal() {
    const backdrops = document.querySelectorAll(".modal-backdrop");
    backdrops.forEach((backdrop) => backdrop.remove());
    document.body.classList.remove("modal-open");
    document.body.style.removeProperty("overflow");
    document.body.style.removeProperty("padding-right");
  }
}
