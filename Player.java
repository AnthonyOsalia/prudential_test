import java.util.*;
import java.io.*;
import java.math.*;

class Player {

    public static String solve(int clawPos, int[] boxes, boolean boxInClaw) {
        // Write your code here
        // To debug: System.err.println("Debug messages...");
        // get highest stack
        int highest_stack_index = 0;
        int lowest_stack_index = 0;
        int highest_stack_value = 0;
        int lowest_stack_value = 0;

        for (int i = 0; i < boxes.length; i++) {
            if(i==0){
                highest_stack_value=boxes[i];
                lowest_stack_value= boxes[i];
            }

            if (boxes[i]>highest_stack_value){
                highest_stack_value= boxes[i];
                highest_stack_index= i;
            }

            if (boxes[i]<lowest_stack_value){
                lowest_stack_value= boxes[i];
                lowest_stack_value= i;
            }
        }


        System.out.println(highest_stack_index);
        System.out.println(lowest_stack_index);
       
        if (clawPos==highest_stack_index){
            // if there is no box in the claw then pick other 
            if (!boxInClaw){
                return "PICK";
            }
        }
        else if (clawPos==lowest_stack_index){
            // if there is a box in the claw then place otherwise go pick from highest
            if(boxInClaw){
                return "PLACE";
            }
        }

            

        //get clow direction
        if (clawPos==0){
            return "RIGHT";
        }else if( clawPos==(boxes.length-1)){
            return "LEFT";
        }else{
            //if in clow then go to lowerside otherwise go to higher side
            if (boxInClaw){
                try {
                    if (boxes[clawPos]>boxes[clawPos+1]){
                    return "RIGHT";
                }else{
                    return "LEFT";
                }
                } catch (Exception e) {
                    return "LEFT";
                }
            }else{
                try {
                    if (boxes[clawPos]<boxes[clawPos+1]){
                    return "RIGHT";
                }else{
                    return "LEFT";
                }
                } catch (Exception e) {

                    return "LEFT";
                }
            }
            
        }
        
        

        // return "";
            
        
    }

    /* Ignore and do not change the code below */
    // #region main
    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);

        // game loop
        while (true) {
            int clawPos = in.nextInt();
            boolean boxInClaw = in.nextInt() != 0;
            int stacks = in.nextInt();
            int[] boxes = new int[stacks];
            for (int i = 0; i < stacks; i++) {
                boxes[i] = in.nextInt();
            }
            PrintStream outStream = System.out;
            System.setOut(System.err);
            String action = solve(clawPos, boxes, boxInClaw);
            System.setOut(outStream);
            System.out.println(action);
        }
    }
    // #endregion
}