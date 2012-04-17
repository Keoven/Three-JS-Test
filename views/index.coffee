root = this

$( ->
  WIDTH = 800
  HEIGHT = 600

  VIEW_ANGLE = 45
  ASPECT = WIDTH / HEIGHT
  NEAR = 0.1
  FAR = 10000

  $container = $("#container")

  renderer = new THREE.WebGLRenderer();
  camera = new THREE.PerspectiveCamera(
    VIEW_ANGLE, ASPECT, NEAR, FAR)
  scene = new THREE.Scene
  scene.add(camera)

  camera.position.z = 300
  renderer.setSize(WIDTH, HEIGHT)
  $container.append(renderer.domElement)

  rectangleMaterial =
    new THREE.MeshLambertMaterial(
        color: 0xCC0000);

  root.rectangle = new THREE.Mesh(
    new THREE.PlaneGeometry(
      160, 90, 10, 10),
    rectangleMaterial)

  scene.add(rectangle)
  pointLight =
    new THREE.PointLight(0xFFFFFF)

  pointLight.position.x = 10
  pointLight.position.y = 50
  pointLight.position.z = 130
  scene.add(pointLight)

  renderer.render(scene, camera)

  frame = 0;
  update = ->
    rectangle.material.opacity -= 0.01
    rectangle.material.map =
      THREE.ImageUtils.
        loadTexture("images/sample_picture1.png")

    rectangle.position.x -= 0.15 # Left
    # rectangle.position.x += 0.15 # Right
    # rectangle.position.y += 0.15 # Up
    # rectangle.position.y -= 0.15 # Down
    # rectangle.position.z -= 0.5 # Zoom Out
    # rectangle.position.z += 0.5 # Zoom In
    frame += 0.1;
    renderer.render(scene, camera);
    requestAnimationFrame(update);
  requestAnimationFrame(update);
)
