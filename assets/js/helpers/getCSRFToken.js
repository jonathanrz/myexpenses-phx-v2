function getCSRFToken() {
  return document.head.querySelector("[name~=csrf-token][content]").content;
}

export default getCSRFToken;
