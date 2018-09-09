import java.io.*;
import java.util.*;

class Node{
ArrayList<Node> left;
ArrayList<Node> right;
int left1;
int right1;
int value;  //to store whether its max or min 
int val;    //to store its value 
int level;  //to store the depth
Node parent;
boolean visited;
Node(int l,int r,int val,Node par,int le){
left1 = l;
right1 = r;
value = val;
parent = par;
level = le;
} 
}

class FirstNode{
ArrayList<Node> nodes;
int data;
boolean visited;
FirstNode(int x)
    {
data = x;
    }
}

class MinMaxGame
    {
public static void main(String[] args) throws IOException
    {
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    int num = Integer.parseInt(br.readLine());
    FirstNode firstNode = new FirstNode(num); 
ArrayList<Node> old = new ArrayList<>();
ArrayList<Node> firstLevel = new ArrayList<>();
int value = 1;
int depth = 0,k=0;
for(int i =1;i<=num/2;i++)
    {
Node temp = new Node(i,num-i,value,null,1);
old.add(temp); 
firstLevel.add(temp);
    } 
ArrayList<Node> lastLevel = new ArrayList<>(); 
int level = 1;
while(!old.isEmpty())
    {
k++;
level++;
ArrayList<Node> newLevel = new ArrayList<>();
if(value == 1)
    {
value = -1;
}
else
{
value = 1;
}
for(Node n : old)
    {
ArrayList<Node> leftChild = new ArrayList<>();
ArrayList<Node> rightChild = new ArrayList<>();
for(int i = 1;i<=n.left1/2;i++)
    {
if(i!=n.left1-i)
    {
Node temp = new Node(i,n.left1-i,value,n,level);
leftChild.add(temp);
newLevel.add(temp);
    }
    }
for(int i = 1;i<=n.right1/2;i++)
    {
if(i!=n.right1-i)
    {
Node temp = new Node(i,n.right1-i,value,n,level);
rightChild.add(temp);
newLevel.add(temp);
    }
    }
n.left = leftChild;
n.right = rightChild;
    }
if(newLevel.isEmpty()){
depth = k;
}
old = newLevel;
}
ArrayList<Node> solution = new ArrayList<>();
while(depth!=0)
    {
old = firstLevel;
level = 0;
while(level<=depth)
    {
ArrayList<Node> newLevel = new ArrayList<>();
for(Node n : old)
    {
ArrayList<Node> right = n.right;
ArrayList<Node> left = n.left;
for(Node n1 : right)
    {
newLevel.add(n1);
    }
for(Node n2 : left)
    {
newLevel.add(n2);
    }
    }
old = newLevel;
level++;
if(level==depth)
    {
for(Node n : newLevel)
    {
if(n.right.isEmpty() && n.left.isEmpty())
    {
n.val = n.value;
if(n.val==1)
    {
    solution.add(n);
    }
    }
else
    {
if(n.value==1)
    {
ArrayList<Node> temp1 = n.left;
ArrayList<Node> temp2 = n.right;
int max = -1;
for(Node n1: temp1)
    {
if(n1.val>=max)
    {
max = n1.val;
    }
    }
for(Node n1: temp2)
    {
if(n1.val>=max)
    {
max = n1.val;
    }
    }
n.val = max;
    }
else
    {
ArrayList<Node> temp1 = n.left;
ArrayList<Node> temp2 = n.right;
int min = 1;
for(Node n1: temp1)
    {
if(min>n1.val)
    {
min = n1.val;
    }
    }
for(Node n1: temp2)
    {
if(min>n1.val)
    {
min = n1.val;
    }
    }
n.val = min;
    }
    } 
    } 
    } 
    }
depth--;
    }
for(Node n: firstLevel)
    {
ArrayList<Node> temp1 = n.left;
ArrayList<Node> temp2 = n.right;
int max = -1;
for(Node n1: temp1)
    {
if(n1.val>=max)
    {
max = n1.val;
    }
    }
for(Node n1: temp2)
    {
if(n1.val>=max)
    {
max = n1.val;
    }
    }
n.val = max;
    }

old = new ArrayList<>();
old = firstLevel;
int winOrLose = 0;
int choice;
while(!old.isEmpty())
    {
System.out.println("Choose one of the following");
int i = 1;
    for(Node n : old)
        {
    System.out.print(i+")  " +"["+n.left1+","+n.right1+"]   ");
    i++;
        }
    System.out.println();
    choice = Integer.parseInt(br.readLine());
    Node temp = old.get(choice-1);
    ArrayList<Node> newLevel = new ArrayList<>();
    ArrayList<Node> rightChild = temp.right;
    ArrayList<Node> leftChild = temp.left;
    for(Node n1 : rightChild)
        {
    newLevel.add(n1);
        }
    for(Node n1 : leftChild)
        {
    newLevel.add(n1);
        }
    if(newLevel.isEmpty())
        {
    winOrLose = old.get(0).value;
        }
    old = newLevel;
}
if(winOrLose==-1)
  {
    System.out.println("Agent Lost");
  }
else
  {
    System.out.println("Agent Won");
  }
    } 
}
