with Ada.Calendar;
with Ada.Strings.Unbounded;
with ColdFrame.Instances;

with Air_Traffic_Controller.Air_Traffic_Controller;
with Air_Traffic_Controller.Control_Zone;
with Air_Traffic_Controller.Duty_Station;
with Air_Traffic_Controller.On_Duty_Controller;
with Air_Traffic_Controller.Shift_Specification;

with Air_Traffic_Controller.R2;
with Air_Traffic_Controller.R3;

procedure Air_Traffic_Controller.Setup is

   Air_Traffic_Controller_Handle : Air_Traffic_Controller.Handle;
   Control_Zone_Handle : Control_Zone.Handle;
   Duty_Station_Handle : Duty_Station.Handle;
   On_Duty_Controller_Handle : On_Duty_Controller.Handle;
   Shift_Specification_Handle : Shift_Specification.Handle;

   Now : Ada.Calendar.Time := Ada.Calendar.Clock;

   subtype Handle is ColdFrame.Instances.Handle;

   use Ada.Strings.Unbounded;

begin

-- Set Up Air Traffic Controllers

-- Ianto

-- R1 ("51")
--  (ID => "51", Name => "Ianto", Rating => "C", Time_Logged_In => Now)

   Air_Traffic_Controller_Handle := Air_Traffic_Controller.Create
      (With_Identifier =>
         (ID => To_Unbounded_String("51")));

   Air_Traffic_Controller.Set_Name
      (This => Air_Traffic_Controller_Handle,
       To_Be => To_Unbounded_String("Ianto"));

   Air_Traffic_Controller.Set_Rating
      (This => Air_Traffic_Controller_Handle,
       To_Be => To_Unbounded_String("C"));

   On_Duty_Controller_Handle := On_Duty_Controller.Create
      (With_Identifier =>
         (R1_Parent => Handle(Air_Traffic_Controller_Handle)));

   On_Duty_Controller.Set_Time_Logged_In
      (This => On_Duty_Controller_Handle,
       To_Be => Now);

-- R2 ("51", "SJC18C")
--  Control Zone (Name => "SJC18C", Traffic => 9)

   Control_Zone_Handle := Control_Zone.Create
     (With_Identifier =>
        (Name => To_Unbounded_String("SJC18C")));

   Control_Zone.Set_Traffic
      (This => Control_Zone_Handle,
       To_Be => 9);

   R2.Link
     (Is_Directing_Traffic_Within => Control_Zone_Handle,
      Has_Traffic_Directed_By => On_Duty_Controller_Handle);

-- R3 ("51", "S3")
--  Duty Station (Number => "S3", Location => "Front", Capacity => 45)

   Duty_Station_Handle := Duty_Station.Create
      (With_Identifier =>
         (Number => To_Unbounded_String("S3")));

   Duty_Station.Set_Location
      (This => Duty_Station_Handle,
       To_Be => To_Unbounded_String("Front"));

   Duty_Station.Set_Capacity
      (This => Duty_Station_Handle,
       To_Be => 45);

   R3.Link
     (Is_Being_Used_By => On_Duty_Controller_Handle,
      Is_Logged_Into => Duty_Station_Handle);

-- Toshiko

-- R1 ("53")
--  (ID => "53", Name => "Toshiko", Rating => "A", Time_Logged_In => Now),

   Air_Traffic_Controller_Handle := Air_Traffic_Controller.Create
      (With_Identifier =>
         (ID => To_Unbounded_String("53")));

   Air_Traffic_Controller.Set_Name
      (This => Air_Traffic_Controller_Handle,
       To_Be => To_Unbounded_String("Toshiko"));

   Air_Traffic_Controller.Set_Rating
      (This => Air_Traffic_Controller_Handle,
       To_Be => To_Unbounded_String("A"));

   On_Duty_Controller_Handle := On_Duty_Controller.Create
      (With_Identifier =>
         (R1_Parent => Handle(Air_Traffic_Controller_Handle)));

   On_Duty_Controller.Set_Time_Logged_In
      (This => On_Duty_Controller_Handle,
       To_Be => Now);

-- R2 ("53", "SFO37B")
--  Control Zone (Name => "SFO37B", Traffic => 27),

   Control_Zone_Handle := Control_Zone.Create
     (With_Identifier =>
        (Name => To_Unbounded_String("SFO37B")));

   Control_Zone.Set_Traffic
      (This => Control_Zone_Handle,
       To_Be => 27);

   R2.Link
     (Is_Directing_Traffic_Within => Control_Zone_Handle,
      Has_Traffic_Directed_By => On_Duty_Controller_Handle);

-- R3 ("53", "S2")
--  Duty Station (Number => "S2", Location => "Center", Capacity => 30)
--  (Duty_Station.Number=>"S1", On_Duty_Controller.ID=>67),

   Duty_Station_Handle := Duty_Station.Create
      (With_Identifier =>
         (Number => To_Unbounded_String("S2")));

   Duty_Station.Set_Location
      (This => Duty_Station_Handle,
       To_Be => To_Unbounded_String("Center"));

   Duty_Station.Set_Capacity
      (This => Duty_Station_Handle,
       To_Be => 30);

   R3.Link
     (Is_Being_Used_By => On_Duty_Controller_Handle,
      Is_Logged_Into => Duty_Station_Handle);

-- Gwen

-- R1 ("67")
--  (ID => 67, Name => "Gwen", Rating => "B", Time_Logged_In => Now),

   Air_Traffic_Controller_Handle := Air_Traffic_Controller.Create
      (With_Identifier =>
         (ID => To_Unbounded_String("67")));

   Air_Traffic_Controller.Set_Name
      (This => Air_Traffic_Controller_Handle,
       To_Be => To_Unbounded_String("Gwen"));

   Air_Traffic_Controller.Set_Rating
      (This => Air_Traffic_Controller_Handle,
       To_Be => To_Unbounded_String("B"));

   On_Duty_Controller_Handle := On_Duty_Controller.Create
      (With_Identifier =>
         (R1_Parent => Handle(Air_Traffic_Controller_Handle)));

   On_Duty_Controller.Set_Time_Logged_In
      (This => On_Duty_Controller_Handle,
       To_Be => Now);

-- R2 ("67", "OAK21C")
--  Control Zone (Name => "OAK21C", Traffic => 9),

   Control_Zone_Handle := Control_Zone.Create
     (With_Identifier =>
        (Name => To_Unbounded_String("OAK21C")));

   Control_Zone.Set_Traffic
      (This => Control_Zone_Handle,
       To_Be => 9);

   R2.Link
     (Is_Directing_Traffic_Within => Control_Zone_Handle,
      Has_Traffic_Directed_By => On_Duty_Controller_Handle);

-- R3 ("67", "S1")
--  Duty Station (Number => "S1", Location => "Front", Capacity => 20)

   Duty_Station_Handle := Duty_Station.Create
      (With_Identifier =>
         (Number => To_Unbounded_String("S1")));

   Duty_Station.Set_Location
      (This => Duty_Station_Handle,
       To_Be => To_Unbounded_String("Front"));

   Duty_Station.Set_Capacity
      (This => Duty_Station_Handle,
       To_Be => 20);

   R3.Link
     (Is_Being_Used_By => On_Duty_Controller_Handle,
      Is_Logged_Into => Duty_Station_Handle);

-- Set Up Shift Specification

   Shift_Specification_Handle := Shift_Specification.Create
      (With_Identifier =>
         (Name => To_Unbounded_String("Singleton")));

   Shift_Specification.Set_Max_Shift
      (This => Shift_Specification_Handle,
       To_Be => Duration(2*60*60 + 15*60));

   Shift_Specification.Set_Min_Break
      (This => Shift_Specification_Handle,
       To_Be => Duration(15*60));

end Air_Traffic_Controller.Setup;
