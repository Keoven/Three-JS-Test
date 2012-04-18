(function() {
  var root;

  root = this;

  $(function() {
    var $container, ASPECT, FAR, HEIGHT, NEAR, VIEW_ANGLE, WIDTH, direction, frame, update;
    WIDTH = window.innerWidth;
    HEIGHT = window.innerHeight;
    VIEW_ANGLE = 45;
    ASPECT = WIDTH / HEIGHT;
    NEAR = 0.1;
    FAR = 1000;
    $container = $("#container");
    root.renderer = new THREE.WebGLRenderer;
    root.camera = new THREE.PerspectiveCamera(VIEW_ANGLE, ASPECT, NEAR, FAR);
    root.scene = new THREE.Scene;
    scene.add(camera);
    camera.position.set(0, 0, 300);
    renderer.setSize(WIDTH, HEIGHT);
    $container.append(renderer.domElement);
    root.rectangleMaterial = new THREE.MeshBasicMaterial({
      map: THREE.ImageUtils.loadTexture("images/sample_picture1.png")
    }, {
      color: 0xCC0000
    });
    root.rectangle = new THREE.Mesh(new THREE.PlaneGeometry(160, 90, 10, 10), rectangleMaterial);
    scene.add(rectangle);
    scene.add(new THREE.AmbientLight(0x202020));
    renderer.render(scene, camera);
    direction = "left";
    frame = 0;
    update = function() {
      rectangle.material.opacity -= 0.01;
      switch (direction) {
        case "left":
          rectangle.position.x -= 0.15;
          break;
        case "right":
          rectangle.position.x += 0.15;
          break;
        case "up":
          rectangle.position.y += 0.15;
          break;
        case "down":
          rectangle.position.y -= 0.15;
          break;
        case "zoom-out":
          rectangle.position.z -= 0.5;
          break;
        case "zoom-in":
          rectangle.position.z += 0.5;
      }
      frame += 0.1;
      renderer.render(scene, camera);
      return requestAnimationFrame(update);
    };
    $(window).keypress(function(event) {
      switch (event.keyCode) {
        case 97:
          direction = "left";
          break;
        case 115:
          direction = "down";
          break;
        case 100:
          direction = "right";
          break;
        case 119:
          direction = "up";
          break;
        case 61:
          direction = "zoom-in";
          break;
        case 45:
          direction = "zoom-out";
          break;
        default:
          return;
      }
      rectangle.material.opacity = 1.0;
      rectangle.position.x = 0;
      rectangle.position.y = 0;
      return rectangle.position.z = 0;
    });
    return requestAnimationFrame(update);
  });

}).call(this);
