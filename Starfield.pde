Particle[] stars;
void setup()
{
	size(600,600);
	stars = new Particle[1000];
	for (int i = 0; i < stars.length; i++)
	{
		stars[i] = new Particle();
	}
	stars[0] = new OddballParticle();
	stars[1] = new JumboParticle();
}

void draw()
{
	background(0);
	for (int i = 0; i < stars.length; i++){
		stars[i].show();
		stars[i].move();
	}
}


class Particle{
	int col;
	double myX,myY,angle,speed;
	Particle(){
		angle = Math.random() * (Math.PI * 2);
		col = (int)random(150,255);
		myX = width/2;
		myY = height/2;
		speed = Math.random() * 3 + 1;
	}

	public void move(){
		myX = myX + (Math.cos(angle))*(speed);
		myY = myY + (Math.sin(angle))*(speed);
		if(myX < 0 || myX > width || myY < 0 || myY > height){
			myX = width/2;
			myY = height/2;
			angle = random(0,2*PI);
		}
	}

	public void show(){
		fill(col);
		ellipse((float)myX,(float)myY,5.0,5.0);
	}
}


class OddballParticle extends Particle{
	int col;
	double x, y, angle, speed;
	OddballParticle(){
		x = width/2;
		y = height/2;
		angle = random(0,2*PI);
		speed = 4;
		col = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}

	public void move(){
		x = x + (Math.cos(angle))*(speed) + random(-10,10);
		y = y + (Math.sin(angle))*(speed) + random(-10,10);
		if(x < -50 || x > width+50 || y < -50 || y > height + 50){
			x = width/2;
			y = height/2;
			angle = random(0,2*PI);
			col = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		}
	}

	public void show(){
		fill(col);
		ellipse((int)x,(int)y,40,40);
	}
}

class JumboParticle extends Particle{
	void show(){

		fill(random(0,255),random(0,255),random(0,255));
		ellipse((float)myX,(float)myY,40,40);
	}
}
