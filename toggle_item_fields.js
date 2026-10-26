// Toggle item fields (book vs computer)
function toggleItemFields() {
    const item = document.getElementById('item_type').value;
    const computerFields = document.getElementById('computer-fields');

    if (item === 'Computer') {
        // Hide book fields and show computer fields
        document.querySelector('input[name="book_title"]').required = false;
        document.querySelector('input[name="book_code"]').required = false;
        // require computer fields
        document.getElementById('computer_type').required = true;
        document.getElementById('computer_code').required = true;
        computerFields.classList.add('active');
    } else {
        // Book selected
        document.querySelector('input[name="book_title"]').required = true;
        document.querySelector('input[name="book_code"]').required = true;
        // optional computer fields
        document.getElementById('computer_type').required = false;
        document.getElementById('computer_code').required = false;
        computerFields.classList.remove('active');
    }
}
