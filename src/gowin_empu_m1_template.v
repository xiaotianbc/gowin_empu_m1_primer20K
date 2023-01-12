
`resetall

module Gowin_EMPU_M1_template (
    GPIO,
    JTAG_3,  //trstn
    JTAG_4,  //NC
    JTAG_5,  //tdi
    JTAG_6,  //NC
    JTAG_7,  //tms   |       swdio
    JTAG_8,  //extFlash_sspi2_sio3/holdn
    JTAG_9,  //tck   |       swclk
    JTAG_10,  //extFlash_spi2_mosi/sio1
    JTAG_11,  //NC    |       
    JTAG_12,  //extFlash_spi2_sclk
    JTAG_13,  //tdo   |       swo
    JTAG_14,  //extFlash_spi2_miso/sio0
    JTAG_15,  //srstn
    JTAG_16,  //extFlash_spi2_cs
    JTAG_17,  //NC
    JTAG_18,  //extFlash_sspi2_sio2/WPn
    UART0RXD,
    UART0TXD,
    UART1RXD,
    UART1TXD,
    SCL,
    SDA,
    MOSI,  //SPI output
    MISO,  //SPI input
    SCLK,  //SPI clock
    NSS,  //SPI chip select
    SD_CLK,
    SD_CS,
    SD_DATAIN,
    SD_DATAOUT,
    SD_CARD_INIT,  //0:ok
    SD_CHECKIN,
    SD_CHECKOUT,
    RGMII_TXC,
    RGMII_TX_CTL,
    RGMII_TXD,
    RGMII_RXC,
    RGMII_RX_CTL,
    RGMII_RXD,
    MDC,
    MDIO,
    FLASH_SPI_HOLDN,
    FLASH_SPI_CSN,
    FLASH_SPI_MISO,
    FLASH_SPI_MOSI,
    FLASH_SPI_WPN,
    FLASH_SPI_CLK,
    HCLK,  //System Clock
    hwRstn  //System Reset
);

  //JTAG
  inout JTAG_3;
  inout JTAG_4;
  inout JTAG_5;
  inout JTAG_6;
  inout JTAG_7;
  inout JTAG_8;
  inout JTAG_9;
  inout JTAG_10;
  inout JTAG_11;
  inout JTAG_12;
  inout JTAG_13;
  inout JTAG_14;
  inout JTAG_15;
  inout JTAG_16;
  inout JTAG_17;
  inout JTAG_18;

  input HCLK;  // System clock
  input hwRstn;  // System reset

  //GPIO
  inout [15:0] GPIO;

  //UART0
  input UART0RXD;
  output UART0TXD;

  //UART1
  input UART1RXD;
  output UART1TXD;

  //I2C
  inout SCL;
  inout SDA;

  //SPI
  output MOSI;  // SPI output
  input MISO;  // SPI input
  output SCLK;  // SPI clock
  output NSS;  // SPI chip select

  //SD-Card
  output SD_CLK;
  output SD_CS;
  output SD_CHECKOUT;
  output SD_DATAOUT;
  output SD_CARD_INIT;  //0:ok
  input SD_CHECKIN;
  input SD_DATAIN;

  //Ethernet
  output RGMII_TXC;
  output RGMII_TX_CTL;
  output [3:0] RGMII_TXD;
  input RGMII_RXC;
  input RGMII_RX_CTL;
  input [3:0] RGMII_RXD;
  output MDC;
  inout MDIO;

  //SPI-Flash
  inout FLASH_SPI_HOLDN;
  inout FLASH_SPI_CSN;
  inout FLASH_SPI_MISO;
  inout FLASH_SPI_MOSI;
  inout FLASH_SPI_WPN;
  inout FLASH_SPI_CLK;

  //------------------------------- AHB Master [1] -----------------------------//
  wire [31:0] AHB1HRDATA;  // Data from slave to master
  wire        AHB1HREADYOUT;  // Slave ready signal
  wire [ 1:0] AHB1HRESP;  // Slave response signal  
  wire [ 1:0] AHB1HTRANS;  // Transfer type
  wire [ 2:0] AHB1HBURST;  // Burst type
  wire [ 3:0] AHB1HPROT;  // Transfer protection bits
  wire [ 2:0] AHB1HSIZE;  // Transfer size
  wire        AHB1HWRITE;  // Transfer direction
  wire        AHB1HMASTLOCK;  // Transfer is a locked transfer
  wire        AHB1HREADYMUX;  // Ready mux signal
  wire [ 3:0] AHB1HMASTER;  // Transfer is a locked transfer
  wire [31:0] AHB1HADDR;  // Transfer address
  wire [31:0] AHB1HWDATA;  // Data from master to slave
  wire        AHB1HSEL;  // Select
  wire        AHB1HCLK;  // Bus clock signal
  wire        AHB1HRESET;  // Bus reset signal

  Gowin_AHB_Multiple u_ahb_multiple (
      .AHB_HRDATA   (AHB1HRDATA),
      .AHB_HREADY   (AHB1HREADYOUT),    //ready signal, slave to MCU master, 1'b1
      .AHB_HRESP    (AHB1HRESP),        //respone signal, slave to MCU master
      .AHB_HTRANS   (AHB1HTRANS),
      .AHB_HBURST   (AHB1HBURST),
      .AHB_HPROT    (AHB1HPROT),
      .AHB_HSIZE    (AHB1HSIZE),
      .AHB_HWRITE   (AHB1HWRITE),
      .AHB_HMASTLOCK(AHB1HMASTLOCK),
      .AHB_HMASTER  (AHB1HMASTER),
      .AHB_HADDR    (AHB1HADDR[11:0]),
      .AHB_HWDATA   (AHB1HWDATA),
      .AHB_HSEL     (AHB1HSEL),
      .AHB_HCLK     (AHB1HCLK),
      .AHB_HRESETn  (AHB1HRESET)
  );

  //--------------------- APB Master [1] ---------------------------//
  wire        APB1PCLK;
  wire        APB1PRESET;
  wire        APB1PENABLE;
  wire [ 7:0] APB1PADDR;
  wire        APB1PWRITE;
  wire [31:0] APB1PWDATA;
  wire [ 3:0] APB1PSTRB;
  wire [ 2:0] APB1PPROT;
  wire        APB1PSEL;
  wire [31:0] APB1PRDATA;
  wire        APB1PREADY;
  wire        APB1PSLVERR;

  wire        PSEL_VALID_ES;
  wire        PENABLE_VALID_ES;

  Gowin_APB2_Multiple multiple_template (
      .pclk   (APB1PCLK),
      .presetn(APB1PRESET),
      .psel   (PSEL_VALID_ES),
      .penable(PENABLE_VALID_ES),
      .pwrite (APB1PWRITE),
      .paddr  ({4'b0000, APB1PADDR[7:2]}),
      .pwdata (APB1PWDATA),
      .prdata (APB1PRDATA)
  );

  Gowin_APB2_Decoder #(
      .ADDR_WIDTH(8)
  ) u_multiple_1 (
      .paddr_i        ({24'h0, APB1PADDR[7:0]}),
      .penable_i      (APB1PENABLE),
      .pprot_i        (APB1PPROT[0]),
      .secure_i       (1'b0),
      .pready_i       (1'b1),
      .psel_valid_o   (PSEL_VALID_ES),            //decoded psel to slave
      .penable_valid_o(PENABLE_VALID_ES),         //decoded penable to slave
      .pready_o       (APB1PREADY),
      .psel_i         (APB1PSEL)
  );

  //---------------------------- Gowin_EMPU_M1 --------------------//
  wire                        GTX_CLK;  //125MHz RGMII clock input
  wire                        MCU_CLK;  //50MHz MCU clock input
  wire clkin = HCLK;  //50MHz

  Gowin_rPLL_1 u_Gowin_rPLL_1 (
      .clkout (GTX_CLK),  //125MHz --> Ethernet
      .clkoutd(),  //50MHz --> MCU
      .clkin  (clkin)
  );

    Gowin_rPLL_my3 your_instance_name(
        .clkout(MCU_CLK), //output clkout
        .clkin(clkin) //input clkin
    );

  wire SD_SPICLK;  //30MHz SDCard SPI clock
  wire RTCSRCCLK;  //3.072MHz RTC clock

  Gowin_rPLL_2 u_Gowin_rPLL_2 (
      .clkout (SD_SPICLK),  //30MHz --> SD-Card
      .clkoutd(RTCSRCCLK),  //3.072MHz --> RTC
      .clkin  (clkin)       //50MHz
  );

  wire LOCKUP;
  wire HALTED;

  Gowin_EMPU_M1_Top u_Gowin_EMPU_M1_Top (
      .LOCKUP         (LOCKUP),
      .HALTED         (HALTED),
      .GPIO           (GPIO),             //GPIO 输入输出
      .JTAG_3         (JTAG_3),           //trstn
      .JTAG_4         (JTAG_4),           //NC
      .JTAG_5         (JTAG_5),           //tdi
      .JTAG_6         (JTAG_6),           //NC
      .JTAG_7         (JTAG_7),           //tms   |       swdio
      .JTAG_8         (JTAG_8),           //extFlash_sspi2_sio3/holdn
      .JTAG_9         (JTAG_9),           //tck   |       swclk
      .JTAG_10        (JTAG_10),          //extFlash_spi2_mosi/sio1
      .JTAG_11        (JTAG_11),          //NC    |       
      .JTAG_12        (JTAG_12),          //extFlash_spi2_sclk
      .JTAG_13        (JTAG_13),          //tdo   |       swo
      .JTAG_14        (JTAG_14),          //extFlash_spi2_miso/sio0
      .JTAG_15        (JTAG_15),          //srstn
      .JTAG_16        (JTAG_16),          //extFlash_spi2_cs
      .JTAG_17        (JTAG_17),          //NC
      .JTAG_18        (JTAG_18),          //extFlash_sspi2_sio2/WPn
      .UART0RXD       (UART0RXD),
      .UART0TXD       (UART0TXD),
      .UART1RXD       (UART1RXD),
      .UART1TXD       (UART1TXD),
      .TIMER0EXTIN    (1'b0),
      .TIMER1EXTIN    (1'b0),
      .RTCSRCCLK      (RTCSRCCLK),
      .SCL            (SCL),
      .SDA            (SDA),
      .MOSI           (MOSI),             // SPI output
      .MISO           (MISO),             // SPI input
      .SCLK           (SCLK),             // SPI clock
      .NSS            (NSS),
      .SD_SPICLK      (SD_SPICLK),
      .SD_CLK         (SD_CLK),
      .SD_CS          (SD_CS),
      .SD_DATAIN      (SD_DATAIN),
      .SD_DATAOUT     (SD_DATAOUT),
      .SD_CARD_INIT   (SD_CARD_INIT),     //0:ok
      .SD_CHECKIN     (SD_CHECKIN),
      .SD_CHECKOUT    (SD_CHECKOUT),
      .RGMII_TXC      (RGMII_TXC),
      .RGMII_TX_CTL   (RGMII_TX_CTL),
      .RGMII_TXD      (RGMII_TXD),
      .RGMII_RXC      (RGMII_RXC),
      .RGMII_RX_CTL   (RGMII_RX_CTL),
      .RGMII_RXD      (RGMII_RXD),
      .GTX_CLK        (GTX_CLK),
      .MDC            (MDC),
      .MDIO           (MDIO),
      .FLASH_SPI_HOLDN(FLASH_SPI_HOLDN),
      .FLASH_SPI_CSN  (FLASH_SPI_CSN),
      .FLASH_SPI_MISO (FLASH_SPI_MISO),
      .FLASH_SPI_MOSI (FLASH_SPI_MOSI),
      .FLASH_SPI_WPN  (FLASH_SPI_WPN),
      .FLASH_SPI_CLK  (FLASH_SPI_CLK),
      .AHB1HRDATA     (AHB1HRDATA),       // Data from slave to master
      .AHB1HREADYOUT  (AHB1HREADYOUT),    // Slave ready signal, from slave, 1'b1
      .AHB1HRESP      (AHB1HRESP),        // Slave response signal  
      .AHB1HTRANS     (AHB1HTRANS),       // Transfer type
      .AHB1HBURST     (AHB1HBURST),       // Burst type
      .AHB1HPROT      (AHB1HPROT),        // Transfer protection bits
      .AHB1HSIZE      (AHB1HSIZE),        // Transfer size
      .AHB1HWRITE     (AHB1HWRITE),       // Transfer direction
      .AHB1HREADYMUX  (AHB1HREADYMUX),    // Ready mux
      .AHB1HMASTLOCK  (AHB1HMASTLOCK),    // Transfer is a locked transfer
      .AHB1HMASTER    (AHB1HMASTER),      // Transfer is a locked transfer
      .AHB1HADDR      (AHB1HADDR),        // Transfer address
      .AHB1HWDATA     (AHB1HWDATA),       // Data from master to slave
      .AHB1HSEL       (AHB1HSEL),         // Select
      .AHB1HCLK       (AHB1HCLK),         // Clock
      .AHB1HRESET     (AHB1HRESET),       // Reset
      .APB1PADDR      (APB1PADDR),
      .APB1PENABLE    (APB1PENABLE),
      .APB1PWRITE     (APB1PWRITE),
      .APB1PSTRB      (APB1PSTRB),
      .APB1PPROT      (APB1PPROT),
      .APB1PWDATA     (APB1PWDATA),
      .APB1PSEL       (APB1PSEL),
      .APB1PRDATA     (APB1PRDATA),
      .APB1PREADY     (APB1PREADY),
      .APB1PSLVERR    (APB1PSLVERR),
      .APB1PCLK       (APB1PCLK),
      .APB1PRESET     (APB1PRESET),
      .HCLK           (MCU_CLK),          //System Clock
      .hwRstn         (hwRstn)            //System Reset
  );

endmodule
