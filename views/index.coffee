root = this

$( ->
  WIDTH = window.innerWidth
  HEIGHT = window.innerHeight

  VIEW_ANGLE = 45
  ASPECT = WIDTH / HEIGHT
  NEAR = 0.1
  FAR = 1000

  $container = $("#container")

  root.renderer = new THREE.WebGLRenderer;
  root.camera = new THREE.PerspectiveCamera(
    VIEW_ANGLE, ASPECT, NEAR, FAR)
  root.scene = new THREE.Scene

  scene.add(camera)
  camera.position.set(0, 0, 300)
  renderer.setSize(WIDTH, HEIGHT)
  $container.append(renderer.domElement)

  root.rectangleMaterial =
    new THREE.MeshBasicMaterial(
        map: THREE.ImageUtils.
          loadTexture("images/sample_picture1.png")
      , color: 0xCC0000);

  root.rectangle = new THREE.Mesh(
    new THREE.PlaneGeometry(
      160, 90, 10, 10),
    rectangleMaterial)
  scene.add(rectangle)


  scene.add( new THREE.AmbientLight( 0x202020 ) );

  renderer.render(scene, camera)

  direction = "left"
  frame = 0;
  update = ->
    rectangle.material.opacity -= 0.01

    switch(direction)
      when "left"
        rectangle.position.x -= 0.15 # Left
      when "right"
        rectangle.position.x += 0.15 # Right
      when "up"
        rectangle.position.y += 0.15 # Up
      when "down"
        rectangle.position.y -= 0.15 # Down
      when "zoom-out"
        rectangle.position.z -= 0.5 # Zoom Out
      when "zoom-in"
        rectangle.position.z += 0.5 # Zoom In

    frame += 0.1;
    renderer.render(scene, camera);
    requestAnimationFrame(update);

  $(window).keypress(
    (event) ->
      switch(event.keyCode)
        when 97 # A
          direction = "left"
        when 115 # S
          direction = "down"
        when 100 # D
          direction = "right"
        when 119 # W
          direction = "up"
        when 61 # =/+
          direction = "zoom-in"
        when 45 # -/_
          direction = "zoom-out"
        else
          return

      rectangle.material.opacity = 1.0
      rectangle.position.x = 0
      rectangle.position.y = 0
      rectangle.position.z = 0
    )

  requestAnimationFrame(update);
)
