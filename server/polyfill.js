// Полифилл для File API
if (typeof globalThis.File === 'undefined') {
  globalThis.File = class File {
    constructor() {
      throw new Error('File constructor is not available in Node.js');
    }
  };
}

// Полифилл для Blob API
if (typeof globalThis.Blob === 'undefined') {
  globalThis.Blob = class Blob {
    constructor() {
      throw new Error('Blob constructor is not available in Node.js');
    }
  };
}

// Полифилл для FormData API
if (typeof globalThis.FormData === 'undefined') {
  globalThis.FormData = class FormData {
    constructor() {
      throw new Error('FormData constructor is not available in Node.js');
    }
  };
}
