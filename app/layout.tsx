import type { Metadata } from "next";
import { Inter } from "next/font/google";
import Head from "@/components/Head"
import SideBar from "@/components/layout/SideBar"

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "ourPortfolio",
  description: "Generated by create next app",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">

      <Head/>
      <body className={`${inter.className} index-page`}>

        <SideBar />

        {children}


      </body>
    </html>
  );
}