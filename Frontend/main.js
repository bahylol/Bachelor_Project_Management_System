function createFooter() {
    var footer = '<div class="footer"><p>&copy; German International University</p><p style="">+20123456789</p></div > ';
    document.body.innerHTML = document.body.innerHTML + footer;
}
window.addEventListener("load", createFooter);