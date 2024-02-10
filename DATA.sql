CREATE TABLE SellerMan (
  idSellerMan INTEGER  NOT NULL  ,
  firstName VARCHAR(20)    ,
  lastName VARCHAR(20)      ,
PRIMARY KEY(idSellerMan));



CREATE TABLE Customer (
  idCustomer INTEGER  NOT NULL  ,
  firstName VARCHAR(15)    ,
  lastName VARCHAR(15)    ,
  telefone INTEGER    ,
  city VARCHAR(20)    ,
  number INTEGER    ,
  postalCode INTEGER    ,
  street VARCHAR(20)      ,
PRIMARY KEY(idCustomer));



CREATE TABLE Phone (
  idTelephone INTEGER  NOT NULL  ,
  Customer_idCustomer INTEGER  NOT NULL  ,
  phone INTEGER      ,
PRIMARY KEY(idTelephone)  ,
  FOREIGN KEY(Customer_idCustomer)
    REFERENCES Customer(idCustomer)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX Phone_FKIndex1 ON Phone (Customer_idCustomer);



CREATE TABLE Car (
  idCar INTEGER  NOT NULL  ,
  idInvoice INTEGER  NOT NULL  ,
  SellerMan_idSellerMan INTEGER  NOT NULL  ,
  Customer_idCUSTOMER INTEGER  NOT NULL  ,
  model VARCHAR(20)    ,
  factory VARCHAR(20)    ,
  color VARCHAR(20)    ,
  serialNumber INTEGER    ,
  condition VARCHAR(20)    ,
  colour DATE    ,
  cost DOUBLE    ,
  introduction DATE      ,
PRIMARY KEY(idCar)      ,
  FOREIGN KEY(Customer_idCUSTOMER)
    REFERENCES Customer(idCUSTOMER)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Customer_idCUSTOMER)
    REFERENCES Customer(idCUSTOMER)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(SellerMan_idSellerMan)
    REFERENCES SellerMan(idSellerMan)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CAR_FKIndex2 ON Car (Customer_idCUSTOMER);
CREATE INDEX CAR_FKIndex3 ON Car (Customer_idCUSTOMER);
CREATE INDEX CAR_FKIndex3A ON Car (SellerMan_idSellerMan);



CREATE TABLE Service (
  idService INTEGER  NOT NULL  ,
  Car_idCar INTEGER  NOT NULL  ,
  cost INTEGER    ,
  receipt DATE    ,
  idTicket INTEGER      ,
PRIMARY KEY(idService, Car_idCar)  ,
  FOREIGN KEY(Car_idCar)
    REFERENCES Car(idCar)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX Service_FKIndex1 ON Service (Car_idCar);



CREATE TABLE Engineer (
  idEngineer INTEGER  NOT NULL  ,
  Service_Car_idCar INTEGER  NOT NULL  ,
  Service_idService INTEGER  NOT NULL  ,
  firstName VARCHAR(20)    ,
  lastName VARCHAR(20)    ,
  hours DOUBLE    ,
  comments VARCHAR      ,
PRIMARY KEY(idEngineer)  ,
  FOREIGN KEY(Service_idService, Service_Car_idCar)
    REFERENCES Service(idService, Car_idCar)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX Engineer_FKIndex1 ON Engineer (Service_idService, Service_Car_idCar);




