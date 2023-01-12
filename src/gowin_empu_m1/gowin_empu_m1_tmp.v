//Copyright (C)2014-2021 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: GowinSynthesis V1.9.8Beta
//Part Number: GW2A-LV18PG256C8/I7
//Device: GW2A-18C
//Created Time: Thu Jul 15 16:53:20 2021

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	Gowin_EMPU_M1_Top your_instance_name(
		.LOCKUP(LOCKUP_o), //output LOCKUP
		.HALTED(HALTED_o), //output HALTED
		.GPIO(GPIO_io), //inout [15:0] GPIO
		.JTAG_3(JTAG_3_io), //inout JTAG_3
		.JTAG_4(JTAG_4_io), //inout JTAG_4
		.JTAG_5(JTAG_5_io), //inout JTAG_5
		.JTAG_6(JTAG_6_io), //inout JTAG_6
		.JTAG_7(JTAG_7_io), //inout JTAG_7
		.JTAG_8(JTAG_8_io), //inout JTAG_8
		.JTAG_9(JTAG_9_io), //inout JTAG_9
		.JTAG_10(JTAG_10_io), //inout JTAG_10
		.JTAG_11(JTAG_11_io), //inout JTAG_11
		.JTAG_12(JTAG_12_io), //inout JTAG_12
		.JTAG_13(JTAG_13_io), //inout JTAG_13
		.JTAG_14(JTAG_14_io), //inout JTAG_14
		.JTAG_15(JTAG_15_io), //inout JTAG_15
		.JTAG_16(JTAG_16_io), //inout JTAG_16
		.JTAG_17(JTAG_17_io), //inout JTAG_17
		.JTAG_18(JTAG_18_io), //inout JTAG_18
		.UART0RXD(UART0RXD_i), //input UART0RXD
		.UART0TXD(UART0TXD_o), //output UART0TXD
		.UART1RXD(UART1RXD_i), //input UART1RXD
		.UART1TXD(UART1TXD_o), //output UART1TXD
		.TIMER0EXTIN(TIMER0EXTIN_i), //input TIMER0EXTIN
		.TIMER1EXTIN(TIMER1EXTIN_i), //input TIMER1EXTIN
		.APB1PADDR(APB1PADDR_o), //output [31:0] APB1PADDR
		.APB1PENABLE(APB1PENABLE_o), //output APB1PENABLE
		.APB1PWRITE(APB1PWRITE_o), //output APB1PWRITE
		.APB1PSTRB(APB1PSTRB_o), //output [3:0] APB1PSTRB
		.APB1PPROT(APB1PPROT_o), //output [2:0] APB1PPROT
		.APB1PWDATA(APB1PWDATA_o), //output [31:0] APB1PWDATA
		.APB1PSEL(APB1PSEL_o), //output APB1PSEL
		.APB1PRDATA(APB1PRDATA_i), //input [31:0] APB1PRDATA
		.APB1PREADY(APB1PREADY_i), //input APB1PREADY
		.APB1PSLVERR(APB1PSLVERR_i), //input APB1PSLVERR
		.APB1PCLK(APB1PCLK_o), //output APB1PCLK
		.APB1PRESET(APB1PRESET_o), //output APB1PRESET
		.AHB1HRDATA(AHB1HRDATA_i), //input [31:0] AHB1HRDATA
		.AHB1HREADYOUT(AHB1HREADYOUT_i), //input AHB1HREADYOUT
		.AHB1HRESP(AHB1HRESP_i), //input [1:0] AHB1HRESP
		.AHB1HTRANS(AHB1HTRANS_o), //output [1:0] AHB1HTRANS
		.AHB1HBURST(AHB1HBURST_o), //output [2:0] AHB1HBURST
		.AHB1HPROT(AHB1HPROT_o), //output [3:0] AHB1HPROT
		.AHB1HSIZE(AHB1HSIZE_o), //output [2:0] AHB1HSIZE
		.AHB1HWRITE(AHB1HWRITE_o), //output AHB1HWRITE
		.AHB1HREADYMUX(AHB1HREADYMUX_o), //output AHB1HREADYMUX
		.AHB1HMASTER(AHB1HMASTER_o), //output [3:0] AHB1HMASTER
		.AHB1HMASTLOCK(AHB1HMASTLOCK_o), //output AHB1HMASTLOCK
		.AHB1HADDR(AHB1HADDR_o), //output [31:0] AHB1HADDR
		.AHB1HWDATA(AHB1HWDATA_o), //output [31:0] AHB1HWDATA
		.AHB1HSEL(AHB1HSEL_o), //output AHB1HSEL
		.AHB1HCLK(AHB1HCLK_o), //output AHB1HCLK
		.AHB1HRESET(AHB1HRESET_o), //output AHB1HRESET
		.RTCSRCCLK(RTCSRCCLK_i), //input RTCSRCCLK
		.SCL(SCL_io), //inout SCL
		.SDA(SDA_io), //inout SDA
		.MOSI(MOSI_o), //output MOSI
		.MISO(MISO_i), //input MISO
		.SCLK(SCLK_o), //output SCLK
		.NSS(NSS_o), //output NSS
		.SD_SPICLK(SD_SPICLK_i), //input SD_SPICLK
		.SD_CLK(SD_CLK_o), //output SD_CLK
		.SD_CS(SD_CS_o), //output SD_CS
		.SD_DATAIN(SD_DATAIN_i), //input SD_DATAIN
		.SD_DATAOUT(SD_DATAOUT_o), //output SD_DATAOUT
		.SD_CARD_INIT(SD_CARD_INIT_o), //output SD_CARD_INIT
		.SD_CHECKIN(SD_CHECKIN_i), //input SD_CHECKIN
		.SD_CHECKOUT(SD_CHECKOUT_o), //output SD_CHECKOUT
		.RGMII_TXC(RGMII_TXC_o), //output RGMII_TXC
		.RGMII_TX_CTL(RGMII_TX_CTL_o), //output RGMII_TX_CTL
		.RGMII_TXD(RGMII_TXD_o), //output [3:0] RGMII_TXD
		.RGMII_RXC(RGMII_RXC_i), //input RGMII_RXC
		.RGMII_RX_CTL(RGMII_RX_CTL_i), //input RGMII_RX_CTL
		.RGMII_RXD(RGMII_RXD_i), //input [3:0] RGMII_RXD
		.GTX_CLK(GTX_CLK_i), //input GTX_CLK
		.MDC(MDC_o), //output MDC
		.MDIO(MDIO_io), //inout MDIO
		.FLASH_SPI_HOLDN(FLASH_SPI_HOLDN_io), //inout FLASH_SPI_HOLDN
		.FLASH_SPI_CSN(FLASH_SPI_CSN_io), //inout FLASH_SPI_CSN
		.FLASH_SPI_MISO(FLASH_SPI_MISO_io), //inout FLASH_SPI_MISO
		.FLASH_SPI_MOSI(FLASH_SPI_MOSI_io), //inout FLASH_SPI_MOSI
		.FLASH_SPI_WPN(FLASH_SPI_WPN_io), //inout FLASH_SPI_WPN
		.FLASH_SPI_CLK(FLASH_SPI_CLK_io), //inout FLASH_SPI_CLK
		.HCLK(HCLK_i), //input HCLK
		.hwRstn(hwRstn_i) //input hwRstn
	);

//--------Copy end-------------------
