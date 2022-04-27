abstract class Greeter 
{
    String greet(String name);
}
class EnglishGreeter implements Greeter 
{
    String greet(String name) => 'Hello $name!';
}
class SwedishGreeter implements Greeter 
{
    String greet(String name) => 'Hej $name!';
}
void main() 
{
    print(EnglishGreeter().greet('World'));
}