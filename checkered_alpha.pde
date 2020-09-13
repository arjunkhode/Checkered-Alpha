/* checkered alpha
Generates squares of random transparency, every group of 4 squares is clubbed together by an outline
** AKTracer aktracer.com

click to generate again
press any key to save
*/

void setup(){
size(1000,1600); // what size canvas do you want? width, height
noLoop();
}

int squares_per_row = 100; // must be a factor of width of canvas. must be even. 
int outline_thickness = 2; // in pixels
color bg_color = #FF00FF; // what color for background?
color paint_color = #BB0000; // what color for the squares?
color outline_color = #BB0000; // what color for outline?
int savenum = 1;


// if squares per row is not even and a factor of width, 
// the rightmost column will club only 2 squares and not 4
// if squares per row is not a factor of width, the rightmost squares will get abruptly cut

// hex values of color work this way #RRGGBB so, #FF0000 would produce red
// hex notation runs from 0 thru F. 0123456789ABCDEF where A = 10 and F = 15
// when r,g and b values are equal, the color is always a variant of grey

void draw(){
  background(255);
  PGraphics bg = createGraphics(width, height);
  PGraphics foreground = createGraphics (width, height);
  
  bg.beginDraw();
  fill(bg_color);
  noStroke();
  rect(0,0, width, height);
  bg.endDraw();
  
  foreground.beginDraw();
  int y = 0;
  for(int x=0; y<height; x+= width/squares_per_row){
    if(x>=width){
      x=0;
      y+=width/squares_per_row;
    }
    fill(paint_color, random(255));
    rect(x, y, width/squares_per_row,width/squares_per_row);
  }
  y = 0;
  for(int x = 0; y<height; x += width/squares_per_row*2)
  {
    if(x>=width){
      x = 0;
      y += width/squares_per_row*2;
    }
  noFill();
  strokeWeight(outline_thickness);
  stroke(outline_color);
  rect(x,y,width/squares_per_row*2,width/squares_per_row*2);
  }
  foreground.endDraw();
  
  
}

void mouseClicked(){
  redraw();
}

void keyPressed(){
  saveFrame("checkered-alpha-"+month()+day()+hour()+minute()+second()+savenum+".png");
  savenum++;
  println("saved "+ savenum);
}
