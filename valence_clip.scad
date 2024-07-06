// valence clip
$fn = 100;
FUDGE = 0.01;

clip_height = 9.3;
hold_height = 9.3;

module innerHold() {
  intersection() {
    linear_extrude(hold_height) {
      polygon(points=[[-FUDGE, 0],
                      [3.8, -3.8],
                      [3.8, 0.5],
                      [0, 3.2],
                      [3.8, 5.9],
                      [3.8, 10.2],
                      [-FUDGE, 6.6],
                      [-FUDGE, 0.0]]);
    }
    translate([-(2*FUDGE), 3.2, hold_height/2])
      rotate([0, 90, 0])
        cylinder(hold_height + 1, d=13.6);
  }
}

module valenceClip() {
  polygon(points=[[0, 0],
                  [10.2, 0],
                  [10.2, 42.5],
                  [0, 42.5],
                  [3.1, 39.5],
                  [3.6, 39.5],
                  [4.4, 40.9],
                  [8.7, 40.9],
                  [8.7, 1.6],
                  [4.4, 1.6],
                  [3.6, 3.0],
                  [3.1, 3.0],
                  [3.1, 3.0],
                  [0, 0]]);
}

union() {
  linear_extrude(clip_height) {
    valenceClip();
  }
  translate([10.2, 14.1, 0])
    innerHold();
}