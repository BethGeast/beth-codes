import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="contact"
export default class extends Controller {
  // connect() {
  // }

  static targets = [ "form" ]

  toggleForm() {
    const form = document.getElementById('contact-form');
    if (form.style.display === "none") {
      form.style.display = "block";
    } else {
      form.style.display = "none";
    }
  }

  preventDefault(event) {
    event.preventDefault();
  }

  submitForm(event) {
    event.preventDefault();
    const form = document.getElementById('contact-form');
    const formData = new FormData(form);

    if (!formData.get('name') || !formData.get('title') || !formData.get('email') || !formData.get('message')) {
      alert('Please fill in all fields.');
      return;
    }

    Rails.ajax({
      url: form.action,
      type: "POST",
      data: formData,
      success: () => {
        form.innerHTML = '<p>Thanks, your message has been sent!</p>';
      },
      error: () => {
        alert('There was an error sending your message. Please ensure all fields have been completed and try again.');
      }
    });
  }
}
