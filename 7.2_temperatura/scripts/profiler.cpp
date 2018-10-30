/*
DESCRIPTION: Generates the file .CFG in the application folder using the debug files 
              platform.cfg, traffic_router.txt and log_energy.txt 
HOW TO EXECUTE: In terminal write: 
  g++ profiler.cpp -o profilerC
  .\profilerC [application_name] [number of columns (dimension x)]
*/

#include <fstream>
#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define SIZE 1024 //max size of the line

using namespace std; 

struct functions
{
    string name;
    int callSendBeforeReceive;
};

//store communication between two tasks 
struct appcfgaux 
{
  string nametask_id; 
  string nameconsumer_id;  
  int task_id;
  int consumer_id;
  int routertask_id;
  int routerconsumer_id; 
  int flits;
};

struct communication
{
  string name;
  int flits;
};

struct appcfg
{
  string name;
  int id;
  int router;
  int load;
  int energy;
  int total;
  vector<communication> comm;
};

//store data of routers from log_energy.txt
struct logenergy
{
  int router;
  int eastflits;
  int westflits;
  int northflits;
  int southflits;
  int localflits;
  int totalflits;
  int numberpck;
  int fluxo0;
  int fluxo1;
  int fluxo2;
  int fluxo3;
  int fluxo4;
  int fluxo5;
};

//store data of processors from log_energy.txt
struct logenergyPROC
{
  int proc;
  int ArithmeticTasks;
  int loadStoreTasks;
  int logicalTasks;
  int moveTasks;
  int ShiftTasks;
  int JumpTasks;
  int BranchTasks;
  int NopTasks;
  int MultDivTasks;
  int OtherTasks;
  int ArithmeticKernel;
  int loadStoreKernel;
  int logicalKernel;
  int moveKernel;
  int ShiftKernel;
  int JumpKernel;
  int BranchKernel;
  int NopKernel;
  int MultDivKernel;
  int OtherKernel;
  int totalKernel;
  int totalTasks;
  int total;
  int load;
};

struct application
{
    string name;
    int id;
};

//store data from traffic_router.txt
struct trafficrouter
{
  int header_time;
  int address;
  int service;
  int payload;
  int bandwidth_allocation;
  int nport; //2*i +1
  int targetRouter;
  int task_id;
  int consumer_id;              
};

// return the name of the function
string ffname(char *line)
{
    int i=1,j=0;
    char *dt; 
    char name[SIZE];
    strtok(line,"(");
    char *lineaux; 
    string aux;
    dt = strchr(line,' '); 
    i = 1;
    if(dt[0] == ' ')
    {
        while(dt[i] != '\0')
        {
            dt[i-1] = dt[i];
            i++;
        }
        dt[i-1] = '\0';
    }
    i=strlen(dt);
    while(dt[i] == ' ' || dt[i] == '\t')
    {
        i--;
    }
    dt[i] = '\0';
    i = 0;
    while(dt[i] != '\0')
    {
        i++;
        if(dt[i] == ' ')
        {
            lineaux = strchr(dt,' '); 
            dt = lineaux;
            i = strlen(dt);
        }
    }
    i=0;
    if(dt[i] == '*' || dt[i] == ' ')
        i++;
    while(dt[i] != '\0' && dt[i] != ' ' && dt[i] !='\t')
    {
        name[j]=dt[i];
        i++;
        j++;
    }
    name[j] ='\0';
    return name; // return the name of the function
}

//receive a line and search for 'S'
string ffnameSend(char *line)
{
    int i=0,j=0;
    char *dt; 
    char name[SIZE];
    dt = strchr(line,'S'); 
    if (dt != NULL)
    {
        while(dt[i] != '\0' && dt[i] != '(')
        {
            name[j]=dt[i];
            i++;
            j++;
        }
        name[j] ='\0';
    }
    return name;
}

//receive a line and search for 'R'
string ffnameReceive(char *line)
{
    int i=0,j=0;
    char *dt; 
    char name[SIZE];
    dt = strchr(line,'R'); 
    if (dt != NULL)
    {
        while(dt[i] != '\0' && dt[i] != '(')
        {
            name[j]=dt[i];
            i++;
            j++;
        }
        name[j] ='\0';
    }
    return name;
}

string ffnameaux(char *line)
{
    int i=0,j=0;
    char *dt; 
    char name[SIZE];
    dt = strtok(line,"(");
    if (dt != NULL){ 
        while(dt[i] == ' ')
        {
            i++;
        }
        if(dt[i] == '*')
            i++;
        while(dt[i] != '\0')
        {
            name[j]=dt[i];
            i++;
            j++;
        }
        name[j] ='\0';
        return name;
    }
    else return NULL;
}

//return 1 if call Send before Receive
//return 2 if call Receive before Send
int SendBeforeReceive(char *app)
{
    functions funaux;
    vector<functions> datafunctions; 
    funaux.callSendBeforeReceive = 0;

    char auxstr[255];
    const char *auxstring;
    int i, j, k, aux, lines =0, funlines =0,count =0, fn =0, flag =0;
    string send, receive, funname;
    char c[SIZE],b[SIZE],c2[SIZE];
    FILE *fd;
    remove("temp.c");
    sprintf(auxstr, "cpp -P -fpreprocessed %s  >> temp.c", app); //Remove comments from app and export to temp.c
    system(auxstr);
    fd = fopen("temp.c","r");
    //discover the name of all functions in the file
    while(fgets(c,SIZE,fd))
    {   
        lines++;
        j=0;   
        for(i=0;i<strlen(c);i++)
        {
            while( c[i] =='\t' || c[i] == ' ')
            {
                i++;
            }
            if( c[i] == '{')
            {
                count++;
                if(flag)
                {
                    send = ffnameSend(c);
                    receive = ffnameReceive(c);
                    if(receive == "Receive" && funaux.callSendBeforeReceive == 0)
                    {
                        funaux.callSendBeforeReceive = 2;
                    }
                    if(send == "Send" && funaux.callSendBeforeReceive == 0)
                    {
                        funaux.callSendBeforeReceive = 1;
                    }
                    funlines++;
                }
                else if(count == 1 && c[0] == '{'  && flag == 0)
                {
                    fn++;
                    flag = 1;
                    funaux.name = ffname(b);
                }
                else if(count == 1  && flag == 0)
                { 
                    k = i;
                    while(c[k-1] == ' ' || c[k-1] == '\t')
                    {
                        k--;
                    }
                    if( c[k-1] == ')')
                    {
                        fn++; 
                        flag = 1;
                        funaux.name = ffname(c);
                    }
                }
            }
            else if( c[i] == '}')
            {
                count--;
                if(count == 0 && flag == 1)
                { 
                    datafunctions.push_back(funaux);
                    funaux.callSendBeforeReceive = 0;
                    flag = 0;
                    funlines = 0;
                }
                else
                {
                    send = ffnameSend(c);
                    receive = ffnameReceive(c);
                    if(receive == "Receive" && funaux.callSendBeforeReceive == 0)
                    {
                        funaux.callSendBeforeReceive = 2;
                    }
                    if(send == "Send" && funaux.callSendBeforeReceive == 0)
                    {
                        funaux.callSendBeforeReceive = 1;
                    }
                    funlines++;
                }
            }
            else if(flag == 1 && i==strlen(c)-1)
            {
                send = ffnameSend(c);
                if (send != "Send")
                {
                    send = ffnameReceive(c);
                    if (send != "Receive")
                    {
                        send = ffnameaux(c);
                    }
                }
                aux = datafunctions.size();
                for(j=0; j< aux ;j++)
                {
                    if(send == datafunctions[j].name)
                    {
                        if(datafunctions[j].callSendBeforeReceive == 2)
                        {
                            funaux.callSendBeforeReceive = 2;
                        }
                        if(datafunctions[j].callSendBeforeReceive == 1)
                        {
                            funaux.callSendBeforeReceive = 1;
                        }
                    }
                }  
                if(send == "Receive" && funaux.callSendBeforeReceive == 0)
                {
                    funaux.callSendBeforeReceive = 2;
                }
                if(send == "Send" && funaux.callSendBeforeReceive == 0)
                {
                    funaux.callSendBeforeReceive = 1;
                }
                funlines++;
            }
        }
        strcpy(b,c);
    }
    lines =0;
    funlines =0;
    count =0;
    fn =0;
    flag =0;
    fclose(fd);
    fd = fopen("temp.c","r");
    //discovers if call Send or Receive first
    while(fgets(c,SIZE,fd))
    {
        lines++;
        j=0;
        for(i=0;i<strlen(c);i++)
        {
            while( c[i] =='\t' || c[i] == ' ')
            {
                i++;
            }
            if( c[i] == '{' )
            {
                count++;
                if(flag)
                {
                    funlines++;
                }                
                else if(count == 1 && c[0] == '{'  && flag == 0)
                {
                    fn++;
                    flag = 1;
                    funname = ffname(b);                       
                }              
                else if(count == 1  && flag == 0)
                { 
                    k = i;
                    while(c[k-1] == ' ' || c[k-1] == '\t')
                    {
                        k--;
                    }
                    if( c[k-1] == ')')
                    {
                        fn++;
                        flag = 1;
                        funname = ffname(c);
                    }
                }
            }
            else if( c[i] == '}')
            {
                count--;                
                if(count == 0 && flag == 1)
                { 
                    if(funname == "main"){
                        aux = datafunctions.size();
                        for(j=0; j< aux ;j++)
                        {
                            if(datafunctions[j].name == "main")
                            {                                
                                if(datafunctions[j].callSendBeforeReceive == 1)
                                {
                                    remove("temp.c");
                                    return 1;
                                }
                                else {
                                    remove("temp.c");
                                    return 0;
                                }
                            }
                        }
                    }
                    flag = 0;
                    funlines = 0;
                }
                else
                {
                    funlines++;
                }
            }
            else if(flag == 1 && i==strlen(c)-1)
            {
                send = ffnameSend(c);
                if (send != "Send")
                {
                    send = ffnameReceive(c);
                    if (send != "Receive")
                    {
                        send = ffnameaux(c);
                    }
                }
                aux = datafunctions.size();
                for(j=0; j< aux ;j++)
                {
                    if(send == datafunctions[j].name)
                    {
                        if(datafunctions[j].callSendBeforeReceive == 2)
                        {
                            remove("temp.c");
                            return 0;
                        }
                        if(datafunctions[j].callSendBeforeReceive == 1)
                        {
                            remove("temp.c");
                            return 1;
                        }
                    }
                }  
                if(funname == "main"){
                    if(send == "Receive")
                    {
                        remove("temp.c");
                        return 0;
                    }
                    if(send == "Send")
                    {
                        remove("temp.c");
                        return 1;
                    }  
                }
                funlines++;
            }
        }
        strcpy(b,c);
    }

    remove("temp.c");
    return 0;
}

//Read files platform.cfg, traffic_router.txt and log_energy.txt and create the .CFG file of the application
int main(int argc, char *argv[]) 
 {
    int ncolunas;
    int dadovalido, aux, aux2, j, i;
    string data, straux;
    char auxstr[255];
    const char *auxstr2;
    application buf_app; 
    trafficrouter buf_trafficrouter;
    appcfg buf_appcfg;
    appcfgaux buf_appcfgaux;
    logenergy buf_logenergy;
    logenergyPROC buf_logenergyPROC;
    stringstream ss; 
    vector<application> dataplatform; 
    vector<application> initialTasks;
    vector<trafficrouter> datatrafficrouter; 
    vector<appcfg> datacfg; 
    vector<appcfgaux> datacfgaux;
    vector<logenergy> datalogenergy; 
    vector<logenergyPROC> datalogenergyPROC;
    vector<trafficrouter> datatrafficrouterservice10and20;
    communication comm;
    ifstream infile; 
    char* HempsPath;
    char *ApplicationName;
    char *PlatformPath;
    char *TrafficRouterPath;
    char *LogEnergyPath;
    char *ArquivoCFG;
    ApplicationName = argv[1];
    ncolunas =  atoi(argv[2]);
    HempsPath = getenv ("HEMPS_PATH");
    if (HempsPath != NULL)
      printf ("The HempsPath is: %s\n",HempsPath);
  //READS PLATFORM.CFG AND STORE THE APP NAME AND ID FOR SUBSEQUENT CORRELATION WITH THE PROCESSOR_ID WHERE THE TASK WAS ALLOCATED
    sprintf(auxstr, "%s/testcases/%s/debug/platform.cfg", HempsPath, ApplicationName);
    PlatformPath = auxstr;
    if (PlatformPath != NULL)
      cout << "File platform.cfg read from: " << PlatformPath << endl;
    
    infile.open(PlatformPath); 
  
  if (infile.is_open() && infile.good())
  { 
    dadovalido = 0;
      while(!infile.fail())
      { 
         getline(infile, data);
         if (data == "END_task_name_relation")
         {
              dadovalido = 0;
         }
         if (dadovalido == 1)
         { 
              ss << data;
              ss >> buf_app.name;
              ss >> buf_app.id;
              dataplatform.push_back(buf_app);
              ss << "";
              ss.clear();
         }
         if (data == "BEGIN_task_name_relation")
         {
              dadovalido = 1;
         }
      }
   
      infile.close();
  }
  //READS TRAFFIC_ROUTER.TXT TO DISCOVER THE NUMBER OF FLITS AND THE PROCESSOR WHERE THE TASK WAS ALLOCATED
  sprintf(auxstr, "%s/testcases/%s/debug/traffic_router.txt", HempsPath, ApplicationName);
  TrafficRouterPath = auxstr;
  if (TrafficRouterPath != NULL)
    cout << "File traffic_router.txt read from: " << TrafficRouterPath << endl;
  infile.open(TrafficRouterPath); 
  if (infile.is_open() && infile.good())
  { 
      while(!infile.fail())
      { 
          getline(infile, data);
          ss << data;
          if (data != "")
          {
            ss >> buf_trafficrouter.header_time;
            ss >> buf_trafficrouter.address;
            ss >> buf_trafficrouter.service;
            if ((buf_trafficrouter.service == 40) )
            {
             ss >> buf_trafficrouter.payload;
             ss >> buf_trafficrouter.bandwidth_allocation;
             ss >> buf_trafficrouter.nport;
             ss >> buf_trafficrouter.targetRouter;
             ss >> buf_trafficrouter.task_id;
             datatrafficrouter.push_back(buf_trafficrouter);
            }
            else if ((buf_trafficrouter.service == 20) || (buf_trafficrouter.service == 10))
            {
             ss >> buf_trafficrouter.payload;
             ss >> buf_trafficrouter.bandwidth_allocation;
             ss >> buf_trafficrouter.nport;
             if(buf_trafficrouter.nport == 9) // IF LOCAL PORT
             {
               ss >> buf_trafficrouter.targetRouter;
               ss >> buf_trafficrouter.task_id;
               ss >> buf_trafficrouter.consumer_id;
               datatrafficrouterservice10and20.push_back(buf_trafficrouter);
             }
            }     
            ss.str("");
            ss.clear(); 
          }   
            ss.str("");
            ss.clear();
      }   
      infile.close();
  }

  aux = datatrafficrouterservice10and20.size();

  if(aux > 0)
  {
    buf_appcfgaux.task_id = datatrafficrouterservice10and20[0].task_id;
    buf_appcfgaux.consumer_id = datatrafficrouterservice10and20[0].consumer_id;
    buf_appcfgaux.flits = 0;
    datacfgaux.push_back(buf_appcfgaux);
  }
  aux2= datacfgaux.size();  
  dadovalido = 1; 
  for(i=0;i<aux;i++)
  {
    aux2= datacfgaux.size();
    for(j=0;j<aux2;j++)
    {
      if (((datacfgaux[j].task_id == datatrafficrouterservice10and20[i].task_id) && 
        (datacfgaux[j].consumer_id == datatrafficrouterservice10and20[i].consumer_id)) ||
        ((datacfgaux[j].task_id == datatrafficrouterservice10and20[i].consumer_id) && 
        (datacfgaux[j].consumer_id == datatrafficrouterservice10and20[i].task_id)))
      {
        datacfgaux[j].flits = datacfgaux[j].flits + (datatrafficrouterservice10and20[i].payload -11); 
        dadovalido = 0;
        j = aux2;
      }
      else
      {
        buf_appcfgaux.task_id = datatrafficrouterservice10and20[i].task_id;
        buf_appcfgaux.consumer_id = datatrafficrouterservice10and20[i].consumer_id;
        buf_appcfgaux.flits = datatrafficrouterservice10and20[i].payload - 11;
      }
    }
    if (dadovalido == 1)
    {    
     datacfgaux.push_back(buf_appcfgaux);
    }
    dadovalido = 1;
  }

  aux = dataplatform.size() - 1;
  aux2 = datatrafficrouter.size();
  for(i=aux; i>=0; i--)
  {
    for(j=0; j<aux2;j++)
    { 
      if (datatrafficrouter[j].task_id == dataplatform[i].id)
      {   
        buf_appcfg.name = dataplatform[i].name;
        buf_appcfg.id = dataplatform[i].id;
        buf_appcfg.router = datatrafficrouter[j].targetRouter;
      }
    }
    datacfg.push_back(buf_appcfg);
  }

  aux   = datacfg.size();
  aux2  = datacfgaux.size();
  for(i=0;i<aux2;i++)
  {
    for(j=0;j<aux;j++)
    {
        if(datacfgaux[i].task_id == datacfg[j].id)
        {
          datacfgaux[i].nametask_id = datacfg[j].name;
          datacfgaux[i].routertask_id = datacfg[j].router;
        }
        else if(datacfgaux[i].consumer_id == datacfg[j].id)
        {
          datacfgaux[i].nameconsumer_id = datacfg[j].name;
          datacfgaux[i].routerconsumer_id = datacfg[j].router;
        }
    }
  }

  //READ FILE LOG_ENERGY.TXT TO DISCOVER LOAD OF THE TASK
  sprintf(auxstr, "%s/testcases/%s/log_energy.txt", HempsPath, ApplicationName);
  LogEnergyPath = auxstr;
  if (LogEnergyPath != NULL)    
    cout << "File log_energy.txt read from: " << LogEnergyPath << endl;

  infile.open(LogEnergyPath); 

  if (infile.is_open() && infile.good())
  { 
      while(!infile.fail())
      { 
          getline(infile, data);
          ss << data;
          if (data != "")
          {            
            ss >> straux;
            if (straux != "PROC")
            {
              ss >> buf_logenergy.router;
              ss >> straux;
              ss >> straux;
              ss >> straux;              
              ss >> buf_logenergy.eastflits;            
              ss >> straux;
              ss >> straux;
              ss >> straux;
              ss >> buf_logenergy.westflits;
              ss >> straux;
              ss >> straux;
              ss >> straux;
              ss >> buf_logenergy.northflits;
              ss >> straux;
              ss >> straux;
              ss >> straux;
              ss >> buf_logenergy.southflits;
              ss >> straux;
              ss >> straux;
              ss >> straux;
              ss >> buf_logenergy.localflits;
              ss >> straux;
              ss >> straux;
              ss >> buf_logenergy.totalflits;
              ss >> straux;
              ss >> straux;
              ss >> buf_logenergy.numberpck;
              ss >> straux;
              ss >> straux;
              ss >> straux;
              ss >> buf_logenergy.fluxo0;
              ss >> straux;
              ss >> straux;
              ss >> straux;
              ss >> buf_logenergy.fluxo1;
              ss >> straux;
              ss >> straux;
              ss >> straux;
              ss >> buf_logenergy.fluxo2;
              ss >> straux;
              ss >> straux;
              ss >> straux;
              ss >> buf_logenergy.fluxo3;
              ss >> straux;
              ss >> straux;
              ss >> straux;
              ss >> buf_logenergy.fluxo4;
              ss >> straux;
              ss >> straux;
              ss >> straux;
              ss >> buf_logenergy.fluxo5;
              datalogenergy.push_back(buf_logenergy);
            }  
            else
            {
              ss >> buf_logenergyPROC.proc;
              ss >> straux;
              ss >> buf_logenergyPROC.ArithmeticTasks;
              ss >> straux;
              ss >> buf_logenergyPROC.loadStoreTasks;
              ss >> straux;
              ss >> buf_logenergyPROC.logicalTasks;
              ss >> straux;
              ss >> buf_logenergyPROC.moveTasks;
              ss >> straux;
              ss >> buf_logenergyPROC.ShiftTasks;
              ss >> straux;
              ss >> buf_logenergyPROC.JumpTasks;
              ss >> straux;
              ss >> buf_logenergyPROC.BranchTasks;
              ss >> straux;
              ss >> buf_logenergyPROC.NopTasks;
              ss >> straux;
              ss >> buf_logenergyPROC.MultDivTasks;
              ss >> straux;
              ss >> buf_logenergyPROC.OtherTasks;
              ss >> straux;
              ss >> buf_logenergyPROC.ArithmeticKernel;
              ss >> straux;
              ss >> buf_logenergyPROC.loadStoreKernel;
              ss >> straux;
              ss >> buf_logenergyPROC.logicalKernel;
              ss >> straux;
              ss >> buf_logenergyPROC.moveKernel;
              ss >> straux;
              ss >> buf_logenergyPROC.ShiftKernel;
              ss >> straux;
              ss >> buf_logenergyPROC.JumpKernel;
              ss >> straux;
              ss >> buf_logenergyPROC.BranchKernel;
              ss >> straux;
              ss >> buf_logenergyPROC.NopKernel;
              ss >> straux;
              ss >> buf_logenergyPROC.MultDivKernel;
              ss >> straux;
              ss >> buf_logenergyPROC.OtherKernel;
              ss >> straux;
              ss >> buf_logenergyPROC.totalKernel;
              ss >> straux;
              ss >> buf_logenergyPROC.totalTasks;
              ss >> straux;
              ss >> buf_logenergyPROC.total;
              buf_logenergyPROC.load = 0;
              datalogenergyPROC.push_back(buf_logenergyPROC);
            } 
          }   
          ss.str("");
          ss.clear();
      }   
      infile.close();
  }

  //energy in pJ
  aux = datalogenergyPROC.size();
  for(i=0; i< aux; i++)
  {
    datalogenergyPROC[i].load = datalogenergyPROC[i].ArithmeticTasks*26.05 +
     datalogenergyPROC[i].loadStoreTasks*44.49 + datalogenergyPROC[i].logicalTasks*22.69
    + datalogenergyPROC[i].moveTasks*21.10 + datalogenergyPROC[i].ShiftTasks*21.76 
    + datalogenergyPROC[i].JumpTasks*20.30 + datalogenergyPROC[i].BranchTasks*31.24
    + datalogenergyPROC[i].NopTasks*14.68  + datalogenergyPROC[i].MultDivTasks*22.67
    + datalogenergyPROC[i].OtherTasks*26.05;
  }

 aux = datalogenergyPROC.size();
 aux2 = datacfg.size();
  for(i=0; i< aux; i++)
  {
    for(j=0; j<aux2;j++)
    {
      if((datacfg[j].router/16 + (datacfg[j].router%16)*ncolunas) == datalogenergyPROC[i].proc)
      {
        datacfg[j].load = datalogenergyPROC[i].load;
      }
    }
  }

  aux = datacfg.size();
  aux2 = datacfgaux.size();
  for(i=0;i<aux;i++)
  {
    for(j=0;j<aux2;j++)
    {
      if(datacfg[i].id == datacfgaux[j].task_id) 
      {
        comm.name = datacfgaux[j].nameconsumer_id;
        comm.flits = datacfgaux[j].flits;
        datacfg[i].comm.push_back(comm);
      }
      else if(datacfg[i].id == datacfgaux[j].consumer_id)
      {
        comm.name = datacfgaux[j].nametask_id;
        comm.flits = datacfgaux[j].flits;
        datacfg[i].comm.push_back(comm);
      }
    }
  }

/* 
// Define the InitialTasks 
*/
  aux = datacfg.size()-1;
  for(i=aux;i>=0;i--)
  {
    sprintf(auxstr, "%s/applications/%s/%s.c", HempsPath, ApplicationName, datacfg[i].name.c_str());
    if(SendBeforeReceive(auxstr) == 1)
    {
      buf_app.name = datacfg[i].name;
      initialTasks.push_back(buf_app);
    }
  }


//Generate the .cfg file

  ofstream outfile;

  sprintf(auxstr, "%s/applications/%s/%s.cfg", HempsPath, ApplicationName, ApplicationName);
  ArquivoCFG = auxstr;
  if (ArquivoCFG != NULL)
    cout << "File .CFG created in: " << ArquivoCFG << endl;
 //GENERATE THE CFG FILE WITH INDENTATION

  /*outfile.open(ArquivoCFG); 
  if (outfile.is_open() && outfile.good())
  { 
    sprintf(auxstr, "<initialTasks>\n");
    outfile << auxstr;
    auxstr2 = datacfg[0].name.c_str();
    sprintf(auxstr, "\t%s\n", auxstr2);
    outfile << auxstr;
    sprintf(auxstr, "\t<dependences>\n");
    outfile << auxstr;
    for(i=0;i<datacfg.size();i++)
    {      
      sprintf(auxstr, "\t<task>\n");
      outfile << auxstr;
      auxstr2 = datacfg[i].name.c_str();
      sprintf(auxstr, "\t\t%s\n", auxstr2);
      outfile << auxstr;
      sprintf(auxstr, "\t\t<load>\n");
      outfile << auxstr;
      sprintf(auxstr, "\t\t\t%d\n", datacfg[i].load);
      outfile << auxstr;
      sprintf(auxstr, "\t\t<comm>\n");
      outfile << auxstr;
      for(j=0;j<datacfg[i].comm.size();j++)
      {  
        auxstr2 = datacfg[i].comm[j].name.c_str();
        sprintf(auxstr, "\t\t\t%s\n", auxstr2);
        outfile << auxstr;
        sprintf(auxstr, "\t\t\t%d\n", datacfg[i].comm[j].flits);
        outfile << auxstr;
      }
      sprintf(auxstr, "\t<end task>\n");
      outfile << auxstr;
    }
    sprintf(auxstr, "<end application>\n");
      outfile << auxstr;
    outfile.close(); */

//GENERATE THE CFG FILE WITHOUT INDENTATION

  outfile.open(ArquivoCFG); 
  if (outfile.is_open() && outfile.good())
  { 
    sprintf(auxstr, "<initialTasks>\n");
    outfile << auxstr;
    for(i=0;i<initialTasks.size();i++)
    {  
      auxstr2 = initialTasks[i].name.c_str();
      sprintf(auxstr, "%s\n", auxstr2);
      outfile << auxstr;
    }
    sprintf(auxstr, "<dependences>\n");
    outfile << auxstr;
    for(i=0;i<datacfg.size();i++)
    {      
      sprintf(auxstr, "<task>\n");
      outfile << auxstr;
      auxstr2 = datacfg[i].name.c_str();
      sprintf(auxstr, "%s\n", auxstr2);
      outfile << auxstr;
      sprintf(auxstr, "<load>\n");
      outfile << auxstr;
      sprintf(auxstr, "%d\n", datacfg[i].load);
      outfile << auxstr;
      sprintf(auxstr, "<comm>\n");
      outfile << auxstr;
      for(j=0;j<datacfg[i].comm.size();j++)
      {  
        auxstr2 = datacfg[i].comm[j].name.c_str();
        sprintf(auxstr, "%s\n", auxstr2);
        outfile << auxstr;
        sprintf(auxstr, "%d\n", datacfg[i].comm[j].flits);
        outfile << auxstr;
      }
      sprintf(auxstr, "<end task>\n");
      outfile << auxstr;
    }
    sprintf(auxstr, "<end application>\n");
      outfile << auxstr;
    outfile.close();
  }
  return 0;
 }
