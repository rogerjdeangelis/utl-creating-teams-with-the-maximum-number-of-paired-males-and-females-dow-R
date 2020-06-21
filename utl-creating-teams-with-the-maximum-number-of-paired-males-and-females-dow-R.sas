We have a list of available male and female players from two states, OHIO and IOWA.                                                
                                                                                                                                   
We need to form two teams with the maximum number of male and female pairs.                                                        
                                                                                                                                   
     Three Solutions                                                                                                               
                                                                                                                                   
         a. SAS DOW loop                                                                                                           
         b. R                                                                                                                      
         c. DFA(Dynamic Function Array) package                                                                                    
            Bartosz Jablonski                                                                                                      
            yabwon@gmail.com                                                                                                       
                                                                                                                                   
            Bart simply and elegantly traverses arrays.                                                                            
            Bart's package seems to another bridge to a matrix language, a little                                                  
            like a HASH. It expands the functionality of the data step.                                                            
                                                                                                                                   
                                                                                                                                   
github                                                                                                                             
https://tinyurl.com/y9e5lfma                                                                                                       
https://github.com/rogerjdeangelis/utl-creating-teams-with-the-maximum-number-of-paired-males-and-females-dow-R                    
                                                                                                                                   
Stackoverflow                                                                                                                      
https://tinyurl.com/ycduv4sa                                                                                                       
https://stackoverflow.com/questions/62468061/reduce-dataframe-to-get-equal-amounts-of-rows-per-value-by-group                      
                                                                                                                                   
Ronak Shah                                                                                                                         
https://stackoverflow.com/users/3962914/ronak-shah                                                                                 
                                                                                                                                   
*_                   _                                                                                                             
(_)_ __  _ __  _   _| |_                                                                                                           
| | '_ \| '_ \| | | | __|                                                                                                          
| | | | | |_) | |_| | |_                                                                                                           
|_|_| |_| .__/ \__,_|\__|                                                                                                          
        |_|                                                                                                                        
;                                                                                                                                  
options validvarname=upcase;                                                                                                       
libname sd1 "d:/sd1";                                                                                                              
data sd1.have;                                                                                                                     
input                                                                                                                              
 team$ sex$ handicap;                                                                                                              
cards4;                                                                                                                            
OHIO F 10                                                                                                                          
OHIO M 15                                                                                                                          
OHIO M 16                                                                                                                          
OHIO M 13                                                                                                                          
IOWA F 14                                                                                                                          
IOWA F 13                                                                                                                          
IOWA M 10                                                                                                                          
IOWA M 17                                                                                                                          
IOWA M 11                                                                                                                          
IOWA M 16                                                                                                                          
;;;;                                                                                                                               
run;quit;                                                                                                                          
                                                                                                                                   
                                                                                                                                   
Up to 40 obs from SD1.HAVE total obs=10                                                                                            
                                                                                                                                   
                               | RULES                                                                                             
                               |                                                                                                   
Obs    TEAM     SEX    HANDICAP| TEAM    SEX   HANDICAP                                                                            
                               |                                                                                                   
  1    OHIO     F        10    | OHIO     F    10  Only one pair is possible                                                       
  2    OHIO     M        15    | OHIO     M    15                                                                                  
  3    OHIO     M        16    |                                                                                                   
  4    OHIO     M        13    |                                                                                                   
                                                                                                                                   
  5    IOWA     F        14    | IOWA     F    14  Two pairss are possible                                                         
  6    IOWA     F        13    | IOWA     F    13                                                                                  
  7    IOWA     M        10    | IOWA     M    10                                                                                  
  8    IOWA     M        17    | IOWA     M    17                                                                                  
  9    IOWA     M        11    |                                                                                                   
 10    IOWA     M        16    |                                                                                                   
                                                                                                                                   
*            _               _                                                                                                     
  ___  _   _| |_ _ __  _   _| |_                                                                                                   
 / _ \| | | | __| '_ \| | | | __|                                                                                                  
| (_) | |_| | |_| |_) | |_| | |_                                                                                                   
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                  
           _     |_|    _                  ___                                                                                     
  __ _    | |__      __| | _____      __  ( _ )    _ __                                                                            
 / _` |   | '_ \    / _` |/ _ \ \ /\ / /  / _ \/\ | '__|                                                                           
| (_| |_  | |_) |  | (_| | (_) \ V  V /  | (_>  < | |                                                                              
 \__,_(_) |_.__(_)  \__,_|\___/ \_/\_/    \___/\/ |_|                                                                              
                                                                                                                                   
;                                                                                                                                  
                                                                                                                                   
 WORK.WANT total obs=6                                                                                                             
                                                                                                                                   
  TEAM    SEX    HANDICAP                                                                                                          
                                                                                                                                   
  OHIO     F        10                                                                                                             
  OHIO     M        15                                                                                                             
                                                                                                                                   
  IOWA     F        14                                                                                                             
  IOWA     F        13                                                                                                             
  IOWA     M        10                                                                                                             
  IOWA     M        17                                                                                                             
                                                                                                                                   
*         ____  _____ _                       _                                                                                    
  ___    |  _ \|  ___/ \     _ __   __ _  ___| | ____ _  __ _  ___  ___                                                            
 / __|   | | | | |_ / _ \   | '_ \ / _` |/ __| |/ / _` |/ _` |/ _ \/ __|                                                           
| (__ _  | |_| |  _/ ___ \  | |_) | (_| | (__|   < (_| | (_| |  __/\__ \                                                           
 \___(_) |____/|_|/_/   \_\ | .__/ \__,_|\___|_|\_\__,_|\__, |\___||___/                                                           
                            |_|                         |___/                                                                      
;                                                                                                                                  
                                                                                                                                   
* There is more than one pairing, this works.                                                                                      
                                                                                                                                   
WORK,WANT total obs=3                                                                                                              
                                                                                                                                   
          Pairs                                                                                                                    
Obs    _G_    _B_    TEAM                                                                                                          
                                                                                                                                   
 1      10     13    OHIO                                                                                                          
                                                                                                                                   
 2      13     16    IOWA                                                                                                          
 3      14     11    IOWA                                                                                                          
                                                                                                                                   
*          _       _   _                                                                                                           
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                                           
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|                                                                                          
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                                          
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                                          
               _                                                                                                                   
  __ _      __| | _____      __                                                                                                    
 / _` |    / _` |/ _ \ \ /\ / /                                                                                                    
| (_| |_  | (_| | (_) \ V  V /                                                                                                     
 \__,_(_)  \__,_|\___/ \_/\_/                                                                                                      
                                                                                                                                   
;                                                                                                                                  
                                                                                                                                   
data want;                                                                                                                         
                                                                                                                                   
 Do until (last.team);                                                                                                             
                                                                                                                                   
  set sd1.have ;                                                                                                                   
  by team notsorted;                                                                                                               
                                                                                                                                   
  cnt_m=sum(cnt_m,(sex="M"));                                                                                                      
  cnt_f=sum(cnt_f,(sex="F"));                                                                                                      
                                                                                                                                   
 end;                                                                                                                              
                                                                                                                                   
 min_sex=min(cnt_m,cnt_f); * max number of couples;                                                                                
                                                                                                                                   
 keep_m=1;  * flag to keep or delete;                                                                                              
 keep_f=1;                                                                                                                         
                                                                                                                                   
 cnt_m =0;                                                                                                                         
 cnt_f =0;                                                                                                                         
                                                                                                                                   
 Do until (last.team);                                                                                                             
                                                                                                                                   
  set sd1.have;                                                                                                                    
  by team notsorted;                                                                                                               
                                                                                                                                   
  cnt_m=sum(cnt_m,(sex="M"));                                                                                                      
  cnt_f=sum(cnt_f,(sex="F"));                                                                                                      
                                                                                                                                   
  if cnt_f gt min_sex then keep_f=0; * exceed count then delete;                                                                   
  if cnt_m gt min_sex then keep_m=0;                                                                                               
                                                                                                                                   
  keep team sex handicap;                                                                                                          
  if keep_m*keep_f=1 then output;                                                                                                  
                                                                                                                                   
 end;                                                                                                                              
                                                                                                                                   
run;quit;                                                                                                                          
                                                                                                                                   
*_        ____                                                                                                                     
| |__    |  _ \                                                                                                                    
| '_ \   | |_) |                                                                                                                   
| |_) |  |  _ <                                                                                                                    
|_.__(_) |_| \_\                                                                                                                   
                                                                                                                                   
                                                                                                                                   
%utl_submit_r64('                                                                                                                  
library(dplyr);                                                                                                                    
library(haven);                                                                                                                    
library(SASxport);                                                                                                                 
library(data.table);                                                                                                               
have<-read_sas("d:/sd1/have.sas7bdat");                                                                                            
want<-have %>%                                                                                                                     
  add_count(TEAM, SEX) %>%                                                                                                         
  group_by(TEAM) %>%                                                                                                               
  mutate(n = min(n)) %>%                                                                                                           
  group_by(SEX, .add = TRUE) %>%                                                                                                   
  sample_n(n) %>%                                                                                                                  
  select(-n);                                                                                                                      
want<-as.data.table(want);                                                                                                         
write.xport(want,file="d:/xpt/want.xpt");                                                                                          
');                                                                                                                                
                                                                                                                                   
libname xpt xport "d:/xpt/want.xpt";                                                                                               
data want;                                                                                                                         
  set xpt.want;                                                                                                                    
run;quit;                                                                                                                          
libname xpt clear;                                                                                                                 
                                                                                                                                   
*             _  __                          _                                                                                     
  ___      __| |/ _| __ _   _ __   __ _  ___| | ____ _  __ _  ___                                                                  
 / __|    / _` | |_ / _` | | '_ \ / _` |/ __| |/ / _` |/ _` |/ _ \                                                                 
| (__ _  | (_| |  _| (_| | | |_) | (_| | (__|   < (_| | (_| |  __/                                                                 
 \___(_)  \__,_|_|  \__,_| | .__/ \__,_|\___|_|\_\__,_|\__, |\___|                                                                 
                           |_|                         |___/                                                                       
;                                                                                                                                  
                                                                                                                                   
Roger,                                                                                                                             
                                                                                                                                   
If I may, it looks like good exercise to use a stack.                                                                              
My approach uses DFA(Dynamic Function Array) Package.                                                                              
                                                                                                                                   
All the best                                                                                                                       
Bart                                                                                                                               
                                                                                                                                   
* My interpretation                                                                                                                
                                                                                                                                   
  Bart's package seems to another bridge to a matrix language, a little                                                            
  like a HASH.                                                                                                                     
  Bart elegantly traverses arrays?                                                                                                 
;                                                                                                                                  
                                                                                                                                   
The output is presented a little differently but has the same information as the first solution.                                   
                                                                                                                                   
                                                                                                                                   
/* setup directory for packages */                                                                                                 
filename packages "%sysfunc(pathname(work))";                                                                                      
                                                                                                                                   
/* enable the framework */                                                                                                         
filename spfinit url "https://raw.githubusercontent.com/yabwon/SAS_PACKAGES/master/loadpackage.sas";                               
%include spfinit;                                                                                                                  
                                                                                                                                   
%installPackage(DFA) /* install the package */                                                                                     
%loadPackage(DFA)    /* load the package content into the SAS session */                                                           
                                                                                                                                   
/* in-log help for: Create Dynamic Hash-based Numeric Stack */                                                                     
%helpPackage(DFA, createDHStack)                                                                                                   
                                                                                                                                   
                                                                                                                                   
data have;                                                                                                                         
input                                                                                                                              
 team$ sex$ handicap;                                                                                                              
cards4;                                                                                                                            
OHIO F 10                                                                                                                          
OHIO M 15                                                                                                                          
OHIO M 16                                                                                                                          
OHIO M 13                                                                                                                          
IOWA F 14                                                                                                                          
IOWA F 13                                                                                                                          
IOWA M 10                                                                                                                          
IOWA M 17                                                                                                                          
IOWA M 11                                                                                                                          
IOWA M 16                                                                                                                          
;;;;                                                                                                                               
run;                                                                                                                               
                                                                                                                                   
/* generate two numeric stacks*/                                                                                                   
%createDHStack(Boys);                                                                                                              
%createDHStack(Girls);                                                                                                             
                                                                                                                                   
data want ;                                                                                                                        
                                                                                                                                   
  retain _G_ _B_ .                                                                                                                 
;                                                                                                                                  
  do until(last.team);                                                                                                             
                                                                                                                                   
    set have;                                                                                                                      
    by team notsorted;                                                                                                             
                                                                                                                                   
    if sex = "F" then call Girls("Put", handicap);                                                                                 
                 else call  Boys("Put", handicap);                                                                                 
  end;                                                                                                                             
                                                                                                                                   
  call Girls("Height", _G_);                                                                                                       
  call  Boys("Height", _B_);                                                                                                       
                                                                                                                                   
  do _N_ = 1 to min(_B_, _G_);                                                                                                     
    call Girls("Pop", _G_);                                                                                                        
    call  Boys("Pop", _B_);                                                                                                        
    output;                                                                                                                        
  end;                                                                                                                             
                                                                                                                                   
  call Girls("Clear", .);                                                                                                          
  call  Boys("Clear", .);                                                                                                          
                                                                                                                                   
  keep team _G_ _B_;                                                                                                               
run;                                                                                                                               
                                                                                                                                   
                                                                                                                                   
                                                                                                                                   
