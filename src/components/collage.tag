<collage>
  <div class="collage" each={images}>
    <img src={id ? createImageUrl(id) : placeholder()} />
  </div>

  <script>
    this.images = [];
    this.length = 0;
    this.disabled = true;

    size (len) {
      let count = 0;
      while (count < len) {
        this.images.push({id: undefined, offset: 'Center', cell: count});
        count++;
      }
    }

    addImage (id) {
      let added = false;
      for (let i = 0; i < this.images.length; i++) {
        if (this.images[i].id === undefined) {
          this.images[i].id = id;
          added = true;
          this.length++;
          checkLength();
        }
      }
      if (!added) alert('All cells full.');
    }

    removeImage (cell) {
      this.images[cell].id = undefined;
      this.length--;
      checkLength();
    }

    changeOffset (cell) {
      this.images[cell].offset = offset;
    }

    resetCollage () {
      for (let i = 0; i < this.images.length; i++) {
        this.images[i].id = undefined;
        this.images[i].offset = 'Center';
        this.length = 0;
        checkLength();
      }
    }

    function checkLength () {
      if (this.length === this.images.length) this.disabled = false;
    }

    function createImageUrl(ipicid) {
      return `${RPIMG_HOST}/ipicimg/${ipicid}-rszh${HEIGHT + 20}`;
    }

    function placeholder() {
      return `http:\/\/placehold.it/${this.cellWidth}x${HEIGHT}`;
    }

  </script>
</collage>
