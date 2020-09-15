-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2020 at 10:43 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `btc3205`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `api_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `user_id`, `api_key`) VALUES
(1, 6, 'GJPt7RiX0DFp4y0GKn48P8n6rA8Uk8jhwSm3hhxsS6TsStJN0Aaho0mWZQEaU5sy'),
(2, 7, '6Zh0ULqLNQLsqzVsQa8xopIl5ADJsDCPVIfvJZSZmmApyEdWhqYx6Exr5fOxW4Fe');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_name` varchar(255) NOT NULL,
  `units` int(11) DEFAULT NULL,
  `unit_price` double(3,2) DEFAULT NULL,
  `orer_status` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `user_city` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `fileToUpload` varbinary(8000) NOT NULL,
  `user_utc_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_offset` int(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `user_city`, `username`, `password`, `fileToUpload`, `user_utc_timestamp`, `user_offset`) VALUES
(5, 'Glo', 'Glo', 'Glo', 'Glo', '$2y$10$DH6Q/QoMGpqAvlfmHFE9rOLifHOrIq.C5JkcbQvh5WRJUBX.savXu', 0x89504e470d0a1a0a0000000d49484452000001000000010008060000005c72a866000000097048597300000ec400000ec401952b0e1b00000e554944415478daeddd5d885dd775c0f17fec4b19c2141498c004c6654c4c7d4d6daa1095c874c05390c10105546aa8a086a6e0821e52a25027185a286e284ec8830aa5e4a10f0e381f0517f4d0805ae4621905e492a432c8c50a12685a0b24b0400a1248ad04e9c3beaa4633f7cefd987bce3ae7acff0f3663cf97d69db3f7ba7befb3cfde2029ad4f4407a04a2c004f00fdc1c727079f5f0216075f5fdef233d7805bc01de0eae073ff0d7c089c072e0ebeae0e3101b4df32b00e7c81871b7d152e031f5092c1cf8153c046f41f40b33301b4cffd06ffdce0633f389e0d4a2278171382548915e055e01cf0ab86970bc037a9ae1722a5b0087c1938497ca39eb59c01be42997b903481bdc09bc04de21bf0bcca6de03865c8226988754a23896eac5597778043d17f6ca929d6298d22ba61d65dce622250626bc069e21b6274390b1c8cbe18525d962963fce886d7b47202ef1ca8c37ac051e03af18dada9e536e516e242f4c592e6698d76dcc36f4ab984f303ea801ef01a7097f846d5c6f25dec0da8a59669f7229ea694b33837a09639005c21bef174a5dc040e475f54691cbbfc0e0994540f788bf846d2f5729af29c84d4188b94fbd8d18d234b39c7f60d4da4107b70455f44f990f8bd1094dc32a522463786ace50ae5e949a97636fe66949b948556526d6cfccd2a1fe370403559c4317f13cb159c1854c57ae47c76bf2de543dc7e4c15f13e7f3b8aeb04548963c4576ecb64e578746551b71c22be525ba62b47a32b4d1b7830c878ab9427d2f64407a2a9dc039e057e161d4893990076d6a3ec6dbf2f3a10cd6403f81c70233a90a67a243a8086fb0e36fe365b05de880ea2c91e8d0ea0c10e017f1b1d8476ad0ffc12782f3a9026720830dc22e59ef24a74209a8b5bc05394d38db5894380e1fe021b7f972c528673dac21ec0767dcaf3e6bde8403477cf036f4707d1242680ed4e52f6f453f79c079ea1dc22144e026e7518f8467410aacc12e5f0919f4407d214f6001ee8011728b78ed45d3780c7716d00e024e0662f61e3cf600ff0b5e8209ac21e40d1a3dcf6f3008a1cec050cd803285ec2c69f89bd80017b00c539e0e9e82054ab6bc063c09de84022d903284b7e6dfcf92c0147a28388660f007e8a0ffc647595d20b48bb2e207b0fa08f8d3fb365922ffaca9e00fe383a00854b5d07b20f013ec2877eb2bb037c9af2c4603a997b0007b0f1ab1c377e383a88289913c01f4507a0c6485b17b20e01162927c9b87fbcee7b8c841b8664ed01ac61e3d7c30e460710216b02782e3a00354eca3a913501ac4707a0c6598f0e2042c6398045e03a6ef9a5ed9ea2ec1a9446c61ec01a367e0db71e1d40dd32268094633d4d245dddc89800d6a2035063a5ab1b19e7003ea63c0a2a0df3eb245a169cad07b0848d5f3beb470750a76c09c06dbf344eaa3a922d01b8f38fc6f9ade800ea942d013c191d801acf214087a5eade6926a9ea48b604902abb6b26a9ea48b604b0101d801a2f551dc996007c04589348534fb22500d700681269ea49b6042069934c0960353a00b5c66a740075c99400246d912901b80780b445a60490f6fc3769944c0920cd239edab53475255302b8161d805a234d5dc99400246d912d016c4407a056d8880ea02ed91280a44db2258034633bcd2c551dc996002e4607a0c64b5547b22580ff8c0e408df741740075ca9600521dfba499fc223a803a654b00a9ba779a49aa3a922d01d803d038a9ea48b604708744f77835b57bd803e8bcf7a30350637d40b287c632268077a30350639d8a0ea06e1913c0a9e800d458e9de1c329e0e0c701dd8131d841ae753c08de820ea94b10700f602b4ddfb246bfc903701a4ebea69ac53d10144c89a004e4507a0c6f9b7e80022649d0300b840b2832035d22de0d3947522a964ed0100fc303a0035c63f91b0f143ee04f06674006a8c1f44071025f31000e034b0161d84425d061e8b0e224ae61e0024cefcfa7fdf8f0e2052f61ec012f011c9ce84d7439e21d926209b65ef015c037e1c1d84c2fc8cc48d1f4c00007f131d80c278ed05c071e0579654e56c74a55373ec25be425aea2d87a22b5d13649f04dcec04f0427410aac579e0a9e8209ac0398007be1d1d806ae3b51eb007f0b093c081e82054a9f3945b7fa9b6fe1ac504f0b03e700ee84507a2ca3c0fbc1d1d44533c1a1d40c35c033e89cb83bbea1f81ef4407d124f600b65ba4f40256a303d15cdda074fd2f4707d2244e026e770bf85a74109abbd7b0f16b0a2788bf576d994f715e67048700a3ad52568bb97b70bbdd039ea5acfbd7160e0146db00fe243a08eddad7b1f16b178e11df85b5cc568e47579ea67308305e0f3803ec8b0e4453d9003e47c2bdfea7610298cc2ace07b489e37ecddd41e02ef1dd5acbf87224bab2a89b8e105fb92d3b1757faa952af105fc92dc3cb1bd19543397867a079e5382ef6518dde20bed25b4a394d798643aa4d0f788bf8ca9fbdd8f815a687c381c872021bbf1ae09bc437866ce54738e657831c25be516429c7a22fb634cc615c2c54757925fa224b3bd9075c22bea174ad7c8cdbb6ab25f6e06943f32ca78195e88b2a4deb280e09765b5ec7c93eb5d83eca11e4d10da96dc52ebf3a638172abf036f10dabe9e52ef05d7cf45a1df4046e36ba5371e315a57008ef146cedeebf1c7d51a43a2d502609af10df00a3ca75ca7efd76f79556c64460c397b658a074832f10df40ab2a5728c9ce862f8dd0035ea42c24eaca1a8293c09729494ed2849680af003f25be114f5b3e045ec5157cd25cf4296b09ced0dc9ec159caa69cdeca6b09cf0568a745600d780e58a734b888e5b2ef03a78077071f3d84a3654c00ddb04849027de049ca82a3fee0e33c5c063e002e02bf187c7c0f1b7ceb9900ba6d819204962863f11e6506fe53948361ef8fcfaf02ff0bdc04ae0d3eb74169e017815bd12f449224499224499224499a0f97b076c732ee2b3894eb006015789ab270e6b737fdf702f03de0cff03e785bf5289b8a1e1dfcfff941f9f9a6ff3e1f1da4eab54c7932ed4d267b06ff1265d9addae569cab30993ec4df0167084f266a08e59a0ec2e7b8cf284da2c0fb9dcc5eda9dbe41566df80f5126553d217f1e0d156db4fb9901f33dfa7dd9e8e7e611a69057887f95def9b949ee281e817a6c9ac007f49b5bbeadca63c96ebbb4373f428effad7a9eeba7f44e905f6a35facb65ba7ec3a53e7b3ef1f012f45bf70f102b30fed662d67283b3b2bd841e6dbe59bb532ec8ffe4324d427fe8c85b39413a19d1baad921269be1adb3bc41b9c3a06aeda1ec3ad4a45d912e50ee2c99082ab646f31afed6f981639808aab087b2957895e3fc79240287061558017e44fc059eb4dca5f408e6b5234f66cb94a4daa673154fe264e15c2c507696bd49fc453511d4ab8d0d7febb57f1dcf4098d93add3924e32e659fff83384e1c679dd2db6b6bc3df5aae5016156942f7d76f475fb82a2b84f7931f767ffdc625e2af4f55e54d5c3b32d62aed3c0463d6729abc27e62c50de194fd0ac19fd2acb25bc653cd24bb477acbfdb729bd2108ed0edc790972809ef2df25eebbb94de8e43c18105ca4459f48569523947596edc85a710f7522afc9906fc5d9b544ed380dbc5d1fb012c53de0dba50d1ab7203f809f01f94e1d17b3cd8bbbf69f6500e28d9077c81d2dd0dafe40db6017c91c03d092213401ff867bc45368bcb9444f0ef94137b3606e54e4dff7e8f325fb34a793af2f394c6eeb59cde0de0f72947abd52e2a011ca0dc16735674be2ef320196c00ff4539d9e7beab3c4812377870b4d722657c0ea5716f9e8758051e077e83078d7e35fa8576cc3de04f293b5075decbe499f5b558a629afeda25dcde4d19affbda3c0df53cea593f4b0e728f328ff5ad73f586702384a59da2969b4fdd49804ea4a0087817fa8e9df92da6e3ff03f94bb3f95aa2301bc08fc00bbfdd2340e00bfa4dceda94cd509e045ca831dae7a92a6f7021527812a6f03eea5ac76f2569f34bb7bc097807fa9e2975795009629abd6babcae5daacb2de077a860c56015e3f21ea5db6fe397e663918a16ce559100fe8eb2a983a4f9e953c17cdabc27015f06febaaebf8894cc6f52deb4df99d72f9ce71c409fb2636fc6cd2da43afd1e737a78685e09a04799f177b713a97a1bc033cce1d8fa79cd01bc828d5faacb2ae570945d9b470f602fe5969f8b7da47a7d09f8f16e7ec16e13408fd2f8f746ff25a4842e5386023766fd05bb1d02bc8a8d5f8ab2c22e8702bbe9012c530eee70a9af14e71e6595e0fbb3fcf06e7a007f858d5f8a76ff209d99ccda03e853b6ae76e24f6a86e781b7a7fda1597b00af63e3979a64a6b980599602af03df8a7eb5921eb24cd9057aaab980598600efe0c33e52135d049ea24c0c4e64da21c07e6cfc52533dc19447914f9b00be1afd0a25ed68aa363acd10608572bcb1937f52b33dcb84fb084ed303f82a367ea90dfe7cd26f9cb407b0005ca11c5820a9d9ee51ce73bc3cee1b27ed01bc8c8d5f6a8b1e13ce054c9a00fe30fa15499acae149be699204b002ac45bf1a495399a8dd4e9200a6baaf28a931fe60dc374c9200c6fe12498d34f6cd7b5c02b0fb2fb5d7d8f63b2e01d8fd97da6dc71efcb80460f75f6ab7433b7d71a785400bc0753ce8436abbc72967096cb3530f603f367ea90bd6477d61a704e0e49fd40dbf3bea0b8fccf243925a65e49bf9a839801e65fcefaebf52377c06b8baf593a37a00fbb0f14b5d32b417302a0178da8fd42d9f1ff6c95109e0b3d1d14a9aab27867df29169be59526b9900a4c486b6e95177016ee32220a96bb6dd0918d60358c1c62f75d1b65ec0b004d08f8e525225b6b5ed513d0049ddf3d8d64fcc7a3ab0a40e1896001cff4bddf46b5b3f312c017c263a4a499558defa0987005262c312c027a3839254896d0ff80d4b004bd1514aaac4b6b6ed10404acc04202566029012330148899900a4c44c005262260029311380949809404acc04202566029012330148899900a4c44c005262260029311380949809404acc04202566029012330148899900a4c44c005262260029311380949809404acc04202566029012330148899900a4c44c0052622600293113809498094092a48cfe0ff92f609ccff2a81f0000000049454e44ae426082, '0000-00-00 00:00:00', 0),
(6, 'Me', 'Me', 'Me', 'Me', '$2y$10$Qedh.auld1Wg.DfIMak5uuOVaCmSAwHeryIAJgE1bl3ctGBh9uVmq', 0x89504e470d0a1a0a0000000d49484452000000c8000000c80806000000ad58ae9e0000000473424954080808087c086488000000097048597300000b1300000b1301009a9c1800000e5549444154789ceddd7bb0565519c7f1efe170bf897801b92988a07841b41285d4bc52a95979a9341819331d476b26671a2bb5999a49cb722ca6c6c81ccda4512ac9b47172ccc9f0ae44642a22ca45c00b5e10100e1e4e7f3ce71d0fc8bbcf7ef75aef5afbf2fbccac813fce5e6bedbddee7dd6bbf7b5d404444248b96d815c899dec054e058e060602230021808f403b601ef026b801781c5c042e011a02d427d459aae07300398076c023a32a40d9dc79fda999f48e1f50266034bc91614f5d20bc005406bb85311f1eb44e079fc06c6cee9bf58574da430fa01bfa1b981d1356d07e6007d439c9c888bf1c012c20547d7b40818d3fc5314c9660af01a7182a396d6028736fb44451a35057887b8c1514beb5190488e8c27fe9d63e7b40618ddcc931649a31ff19e39ba4b4fa30777896c2ef1032129ddd8bc5317497602f103a0bbb41d98d6ac0b207e94712c562fe03fc081b12b92c26bc0b2d89548610b7011b03c7645c4dd6ce2df1dca985600e31a6807c9a11ef81f5ba5a420298d19c4ff10953d552a48ca36347b56ec0a54c018e01f542448caf490de1b781be8dfc031eb803f620ff59b80e1d808dc4f630ffb52df4ae053e8c1bd308e257d37610bf02d2ca876655fe09e06f2ab6aaa5477abe8be47ba46dd0c1c9f22bf16e01729f3ac72529014c43cd235e8850de4d903782865be554e0a92027886ee1b72098d3f771d91225f250549eeada3fb46bc2263de791df498b754ba2029d3cfbc0353fccd9319f37e3ce3715553ba9f80cb1420fd52fccddb19f3ce7a5c158d016e8e5d095fca1420efa7f89ba119f3de23e37155b41c9819bb12be942940de4bf1375333e67d74c6e3aa6639f613faaac8f5905d789aee1f229fa3f12f85a929f255b261fb9a4a9c637790ae212f6b20cf9ec0a329f38d953ec086cab8e4b1c8f1780547017c87748db9151bf5db9d1ed8c366ec00e82e38ce010690fd85e6ad9de79a76248282a3a0a691be51b701d7507f60e344e0c106f28b91b661c1519325486ac151f3dd068f5f068caa730d25677a610fea8d34f07ae016e01bd81094ab800780f606f3891d1c358d04c9cec151933648141c05741bf13fbc2182e3ec846b902648ea05474d77dd550547419d44fc0f70cce0a8490a92ee82a3a65e90bc8882a3b05a806789ff416e56709cd5c0b5d85590a40d8e9a2b773a5ec15102e713ffc31c3b386aba0649a3c151530b924a064799a6dcd6b46243df0f8b5d9114566377bceeccc5a606673100b814b81e5bac2e8b8b81bf62f5951298867d18627ff327a576e0e3cdba0022ddf939f18320295ddbbc5317e95e1fd28dcf8a911e41aba6480e8cc14696c60e88ae690530ac99272dd28849d81bf3d881d1814d0b9ed0dcd31569dc24e2df4956a0e0901c1b0d3c41bc670e75ab24f77a033710ee27e076e03af4402e05339574eb68b9a4a7804f843a2111df7a6043c617e337301675e65bc6510a52412dc027b1e11c6f912d28dee83c5e7b0e968cbee576d40398021c87fdf2351118010cc2c6346d05de055ec506ef2d06fe85dd35da23d45744444444444444444444444444444444444444448a4ca379fde905ecd6990674a6819dfff6c36633f6e94cbd3bffbe151b41dc3581cd78ec9adab1e547dbb011c5b5b405d8046cecf2ef06e01d6c731d71a40049b627b61eedc8ceb40fb037b05767da13d81d188205429e6cc202e52de04d6cceca1bc0ebc05a6cc8fe1a6c318bf591ea987b0a105b4c61127020b6eac878601cb02ff9fbd037cb466cd59597b1792e4b81e781ff61015559550b90b1c051c0c7b0895193d11ee8dd79139b18b6089b67ff18164c9550f600d91d380d3815dbbf7b64d4da94c72a6c5b85fb817bb1ae9c14c8486c8ef816e2ac8355a5f43ef02b6078aa9691e86663bfe4c4fee0542dbd037c3545fb48243d815f13ff8352f53407fbf95a72a427309ff81f0e254bf35090e4ca2dc4ff5028ed986e4a6c3109e632e27f1894769d2e4a68b74228facfbce3812540dfd815915dda0c1c82bd802ca4a2f713e70287c6ae84d4d50b1ba9907587dee88a7c07190bbc44b1cfa10adab1a13b2b6357248b2c1bcbe7c52c141c45d04a81df8f14f503d682dd3dc6c6ae88a4b2145b08bc708a7a07998e82a34826609b16154ecfd815c868a6c3b19b816ffbaa48c5fc84ecbf18cec446024b93f5c5c6fd64fd6dfeaef0552e8dbbc97eddd76333290ba5885dac33b169ad592940b273b9764381d37d5544eabb8fecdf629ba8ce2cc16618840d6fcf7afd1784af72b50cc7162350f72a1e976e561b368fbf308ad6c53a0fb7b7ff0a10772ed7b017f0155f15918f72d9b259dd2b3f5cbb594f85af72354cc66d64a9ee1efeb874b33ab055640aa1485d2c97771fa000f1c9f55abab6a5eca4155847f66faccda87be5d360dc16c4584db1be9c73ef33b8ddd2e787af72e92dc0ad4d4e0e5fe5c615258a5d6fc9777aa98574e57a4dd5cdf26437dc7e3551f7aa395cbb599bb0c5bd73ad08779073709b527b1fd618e2d7066c65c5acfa036779aa4ba53d8c5b5ff79cf055ae8cf3706b9b07c357b95cc661fb63a87b954faeddacedc098e0b56e40debb5833719bf5a8ee5573b976b35a28f074dc3c7809b75bf8b9e1ab5c39e7e3d646cf87af72394cc7edc2ab7b15866b37ab03dbb32597f2dcc59ae578bcba5761b876b3c0bdad9b26d49cf491c0686c03cb34cf142dc0d98e656aec5538770167381c7f2ee95f3c766077ac55d81e8b853516b8013b1197dbafba57f9e7a39b9525ad007e8aed2759183d811f60b3c7425fb05ad2d8abf05cc766b9a4adc035146029ddfe587f34d685aa25fd7a159eebaf593ed27dd89ef4b9d402fc85f81749ddab386275b3764e7f26a72b86e6659f0e75afe289d9cdea9a2e69f689366a10f016f12f4c07ea5ec594876e5607b6485dae460a7f9df817a50375af62cb4b37ab03b8d0c709f97a51989715f3f472302e1f2f0d7df1f299f41520877bcac7955e0ec697973698e223135f4ffb6dd8a26031b561cbc9e80e12d760e059e2ef1cb00d0f8b65fb0a902dd8301291bcd882877722beba58af7aca47c497d53e32f115204f78ca47c497c77d64e22b400abbcdaf94d69f7c64e2eb19a427b651a3f60d943c58061c886d41edc4d71de403e0724f7989b8ba1c0fc1017e87072fc5de624ff398a748a37e04dce42b33dfe3e71fc082e418cff98aa4711d7065ec4aa4f179e2cc2454aa667a85260d776ae6b8f9ded8c8dab3b04de4f76e6259523daf018f62d31beec4de9c7b177262496feccd66adccf9c08901cb97e2ba1ff852e7ff3bb0c5ccdb42141c6be6d530eced7beee7104b2e6c03f6c1e67904156b5d2cd7dd6aa55a7a015f8e5170ac009915a95c29ae281beec4e8624d06fe1da15c29be8308bc966f8c3b88ee1e9255f0bb48e83b482bf6703e2c70b9520eabb055143b421518fa0e720a0a0ec96e34705cc802430788eb82d42241f7350cd9c56a01d6a23b88b8798580d32a4206c821c0124f79b5030b81c7b07ee936602fec17b29380219eca91c6bc8d0d585d0cbc89bdbf18031c8d0d60f5d563198fed3e562a17e33e28ad0df819b6df483d7d800b80951eca534a3f587026c9ab888c026ec4becc5ccb2be52fa1bfc5eda2bc4463eb6f0d04fee058a652f7e9761a5bcdf2482ca05ccafc6503e515c622b25f90a5c0f00c65b6609367627f88ca9ae6a46f8a1d8cc06d83d64733969b5bad645fb3f53d608263d90f652c5ba97efa3b6ecf1493b0b594b394bdc1a1dc5c1a4ff686b8c243f9071077c7abb2a52dc07e8d34401d5739d4618487f273e314b25d84f5f8db31e8d68c7550fa689adbe0b5af6720f06ec63a4cf7548744a15e148ece78dc7c6c728c0fbff3948fc06d9ef2d988ed089545d6cf5443420548d6e9b6fff4588785c0768ff955551bf6fec997ac6d1c640a77a8001994f1b8651eebf03e5a43d88795f89dff9db58d077bac435da10224ebd608beba5735da1ac15d5edac4796b8334420548d6212dbb79ad05ecee39bf2aca4b9b041926156bca6d5a933ce635140d94f46114d9bbccbb7290c7bcbccb7b809c94d3bcaaac077082c7fc4ef6989777790f90d3f1f7adef65d75301fc5dcb51c00c4f793545de03a40f70b5877c8e27e7df5405f359fcacbffc7de2ef6d9928ef0102364cfe5487e38700377baa8b9816e016dc7e6a3d0d98eda73acd538400e981adbd3a35c3b183817b80715e6b246003481760c3451a350d9847bc953d532b4280807dd01f04bed6c0318761c3a2838cd9a9a8e38147808353fe7d0b700936eb304b6095d6f5f81b28f718f005eabf289a820da6f331734d295d6ac3e6dd4caed3267db0c5169ef458e60feb94e555eccddeb3380adb347433f00c36f4e1033e9c935eaa61d005d10bb8a833bdca47e7a41f81bf51d9411531406afaa3ee531e8d2479cd804229ca338848140a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a1091040a109104455e17ab9e65d8c26512dee1c0feb12be1531903e45ee09bb12b515173804b6357c22775b1441228404412284044122840441228404412840a90ed81ca01680f5896eca874ed1c2a4036062a07e0bd8065c98e4ad7cea1026465a0720056042c4b7654ba760e15208b029513ba2cd991da39a316602dcddf4c721d05d85ab8c45a81f534bf9d97873aa15077900ee0f701cab9a3b32c89a31ddbffbcd96e0f504670a381ad34772be27d839d8dd4b33fb6eb70b3da7933302cd8d904762dcdbb703f0e781e92ec469ad7ce57073c8fe0fa6243d17d5fb42514741fee921a003c87ff767e02e81df03ca2d80f5883bf8bb60e1817f20424950380d7f1d7ce2b815141cf20a209c0cbb85fb415c04181eb2ee91d0cacc6bd9d5fa4825f827b007793fda2dd03ec19bcd6d2a861c0dfc8dece77024382d73a474e079e22fd055b047c2e4a4dc5c51769ecf9f3716046949a7691a7976a47026702d38189c050ac7eeb81178085c002e0c95815142fa6026700c7f0613b77f0613b3f8cf52c4af5a65c4444aae6ff92c6d040c6956a5b0000000049454e44ae426082, '0000-00-00 00:00:00', 0),
(7, 'Helga', 'Helga', 'Helga', 'Helga', '$2y$10$Whpbclz2Gjx8h6y14/lzZO2pYqv5KjssJuTR57jcno3SeEOebl1wy', 0xffd8ffe000104a46494600010100000100010000ffdb0084000906071213121512121216151517171d1717171717171818181817171718181d18171a1e2820181a251e171521312125292b2e2e2e171f3338332c37282d2e2b010a0a0a0e0d0e1b10101b322620263630352d2d2d322d2d2f37322d35372d2d2f2f382d2e2d2d2d2e2d352f2d2d352d2d2d2d2d2d352d2d2f2d2e2d2d2d2d2d2dffc000110800c2010303012200021101031101ffc4001c0000010403010000000000000000000000000104050602030708ffc400481000010302040305040704070607000000010002110321041231410551610622718191071332a1234262b1c1d1f01424527215438292a2e1f108335383b2b33463647393c2d2ffc4001a010100020301000000000000000000000000040502030601ffc400321100020102050106050305010000000000000102031104122131415105132271b1f06181a1c1e13391d1142332425224ffda000c03010002110311003f00e1ee58a5252d37410627a1402b791d0faf9291e0385356ab29930d993d2de331303cd262f0d55f3532101ad04cc36d1680751e0a6381615aea94ea92080d02066b4020d8cfc8f32a452a779a5c7d88988ac9526d6f6f3b32138c600d179a65d9a0f9fa7842d582c03aafc2479cfe4ad1da3e142a570d6e705c266ee0081a5e00b01a1e6a4b87f0663181ad7b83b626dac132df10b7ac239546b84447da318d18b6fc4cd9d99c1be95314df964126dd6f7fd6ca6b75851a702e64ee7f5a2da19bab8a70c915147375eaf793727c8342d75cdbe28eb6d3cd6d0a1b8ee15b572b5ce21a0e6701267a6a17b51b8c6e8f28454a69376fa99b28cb48a86434e9b86cc0327531a9ea546f19e165cdc8222d1ac96cd839db4193e7e2a67034c5268649206e649bf33b9994e320d5697494e3664a8e2254e778917c23156efb5c1dd4016da003a69f90528fc5b1a24b801ccfeb5501c7312c690d6819c3b3c8faa48fbca8675424c9249eaa24f1bdcf816ad13e97667f536a92f0a64df11e2d98c5390399fc028b256b63966ab2ad69d477932ee861e9d08e582150842d66f042162e74203242c197d4c741f89fc96e219021bf794060913b6536446536e44cfe5f25857c38176991c8ea3f34065806cbcb89971000e83a2c7025a2b3a939d06e46dca04ee5357552d322c427b4599c36abd80bb469040d353d093b29d4279925caf42ab174941b7c3d3c9ff033c6619ad7b9840232666881333cfcd614333a93a1c4326497116cb321b6522f736a38b624eb94ea0586bcd3ff00d9830369e58075d4cee656e546edb5b11a588cb14a4b5fe392bee7b9c1c43f614f39241e9200d7e5a2dd84a41d5035e018163008708e7c8cfc93aaa6987b8019dce316d74db90109f40611b9263c9234eef562a57b46c96fb11a70cd75421a20b4824823974fc534e3944ba9d4797486c651caf7523892c6d401a3bcf12e3d341755bc63c3f3804eb23940e63f158566a316bccdb868ca7252e96fc91c08423dd21571726a400916ea8e690204408d77e6bd3c6c9fe0386f7ed22a5477d1f7600cc72bb4bba5a04cedb299e0d45b48092490fca0ef1317034d7c7455fec962053af0e301cd8b9b4d88fd7556ec5536b5e086360cb8b837702449d01e44ab4c2a4e0a7ca28b1d2946a3a6f67aafb92588e8d93e8b06e5cce9001117dcff0092c9950b8348d0899dbf5f92cead88beb603affa02acb7d4a35a686e012ad74bd236e5e0b7b2993a027c02d899a5a77b182d194b9f972175a6409e565bdcdf5eaa5e95573298f74f6c823346b1bc1dec341f901aabd4c91b9230b47bc9d884f757b882b4711c48a54dcf3ae8d1cdc74fd74562ed039c4b65b61a3ad2640998de6573ced263b3bf203dd66bd5dbfa69eab4d6c464a39f97b1270d83ef713ddee96fe5f9d8897b89249324dc9ea52210b9f3af1415b1af5a92828070956a6396c4004ac34ef3bc8721f9abbf603b18319f4d5a7dd35d95ac1fd6b80bc9d9a091a6a646c67b0e0fb1580a62061a9f5ee8407970d74e296257a7f11d8ec03c43f0948f8b42ae716f645c3aac9a6d7d077361b7f70d901c39d8b083880741b7aab476b3d976370b2fa5188a62f2c10f03ab37f29f054ba0f837d791e7c8a0250d363c00eeeb8e8ee5ca7a28d7cb3e8ea66195e43d93d22d1a191b14ea9bf4727dc5b022abe8bc100d5a5aeb2fa2ec877b4b4356ca57cd6469af6c977c1be9d363053cb3008cd1775f995b38962752d3deb0e42eb0a7529e1e5aeb77065d25fb111ace8b757635c584102483d4ec07c95d7fad96fd0e65ff009a934daebd791a70fa1f4fde034980de5adfcca79c4b09f59bb1cdd0ad9c3b87fbace5ce2e739e4827413a003c169c763f2f74b4c5a48f1d87a2f545461e2d0f1ce53aab23bdb42085073ce77882d6900739d20eca2719c3f23679013e24c29fcf132ecc7346c3281798df92d5c49b42b325b532bac4cced3b73ba81529c651f896b4abca325ff003f05efe255d0b7d5c2c1233b3d7fc90a06565b292647e5b5f54e4618412d749034d35ea5350d3aa58744de3e4bd5e41a7c333a9541361116dbf01aabff0007c49c46140101cd81131f0911a6c634fbd73dca627e6addd8e25ac73803024bc8bc803ba3efd39297839b552dc32bfb4a9a745496e9e859b823cba9349041974c802f98cd8755204269c318d6b72b5a1a018f13ba78af292f02b9ca5777a8da35d2644f8ca9fe0f8771902434b4c9cd13b0307cd45e0f0c6a383418e64e802b3705e1b774b6328969d09d45ceba03cb5becb4e226a31b127074e539dec40ba832f99cd6f22dbcdaf0d3b4f3235b269c4301ddcd4eb38b6448122e48e569b0b1e4aeb43845171ef3419d1d372771adceb7da16cc3f6669924b8834c4c37fb477168851a58a87372753c054ff00548e7bda4e28ea541a0be5e46563634b5dc79c022fb92365cfe548f68f88b6be26a54608a65c453034c82cd31b4fc5e2e2a3556622b7792d36e0bcc261bb9859eef762ca2522168250b295629501b189ff000cc13ebd5651a63bcf7068e9cc9e80493e0a3dabaafb26e00434e31e3bcfee521f6661cef322074079a03a5765b85328d365360ee536e56f53b93d4c93e254f2d787a595a1bcbefdd6c400842100cf899800f5fd7dcb8dfb5eece3065c6d3686cb832b016049f81f6ded949de5abb27151f467c42a976ab042b60b114c89269b88fe660cedf9b420380b5f0072524cadfbbe1aa7fc3c454679546d377ffa516c74884f72fee357ec6229bbfbd4ea37f00b283b3b98548a945c5f3f725f1d827beab5c00f84b6fd75f0db44e5b83d35cc2403c81d872d13ac37c009e52b26732ba354e37bf538b95695b2f4d08fc754788000bde4df4bc46ea3a856a8f25956934b882635036ef1d235fc92f12e20d78c99b29cd632441d3fc9346b6a35cd78b35ce1bd8c7da1ceea254a97968f42c68d1b435493f7efe46bc45468c53854697dc06c658b804da04e9a24a5843ef2a5ce53a696239fa959f130eab4db504fbccf6689d048df4f1f251c5e6cc232b81ef6ad22790d0f928d37696be6be64ea7172868eced66bcb925ffa2a99b93ea4cfc8a16ac1d40d606cb8c4ded7b9e650b6254dad88edd54eca4ca750ad979f84c0e8b6622acc778df517ca16fa0c2dee3a048d6d3e32b16b29341971718d0693b49fd6cabacec5d392bec6fc08f84b0c3cb803780478badcad7bc2b8f0388aad2c731c0dcbad33244116b4cf89503d95c397b2a34b4b98481670046b3622f68f2e6ac1c0e8b5a2a00f0f198b488800f2cba0b4696563848356975f7eec53f68d44f347956f7f864970a616d3636341e71b4f5837eaa4a86e626c66db1dd34c2c96824104ed6b7a2dec741956b15e1b1cfce579b6c7b4daf666ca0ec4c48eefc40e91eaad3d98c69c44b5c402d12434466263bc4e80f4f1511d94aacf7a43dc44b6075da2daed015df07432120693fa33baadc6d54af16b5ea5df665072b4d4bc3ca1960f0196a124fc52433416b4c7eb54c7b4eea947098da81f6141d907f092c22de642b1d46f4e92a93ed20d4185ab2d96e4700e9e6d2482d8d2d3e4a045ba8fe5e85b4a31a2934b9f5ebeec71008421462682108402a50912828096ecd707762b114e836c1c65c7f8582ee3e961d485e91e07816b400d686b18035806800103d02f33767fb695387d773a9d36540e01af0e9980661ae1f0edb1d05acbb6f637dacf0dc486d37bce1aae996b101a4ef96afc3a9fad94f44074442e55da8f6e183c3bcd3c2d27629cd305e1deee9483072bc825fe2041d8950386ff0068233f49c3c4736d7b8f234efea101dcd0a85d98f6b7c3718e14cbdd87a84c06d601a09e8f04b7d482792bea0187197c53f123f3fc14107e6ee9d0dbd53fed257bb59e2e3f70fc5552a768f074dd95f8ba0d70d41aac047889b20385e5ca48dda48f430a4f0e67058a9d9d40ff008dc3f14c389532dacf3020bdc5a416b9ae697182d73496b878129ee11d383c67fc8ffba57a8f193d83ac4d1a6e1fc0245e4981f72d189ad55cd019624969db2e5ea56decfbbf76a64eb71fe2216dad24b84e84474b05d02bca9a77dd238e95a15a4adb37bf98dbfa31afa60bda0bec4ebafaca6b8ac23da5a41fa31ab4e80de08eb2427f82a8e0e20c11cc0bce97f408e238373f2c38b44f7bef1658ca9a71bc56a671ab28d4cb27a15fe23569d36e5ca5d9b5bdc116b13bf5e49962688a8c359cf9be96040df4d7a4f3d958713d9f6d4bb9ee9d4798eaa3bfa28086b600cd961c0cb8c8976ba58c287528d4beab4e0b3a189a39565978b9222861c9682d1239b8c1f4cc8571c3e169b5a1a5a2c23642cd60f4dcd72ed2d5d914b1429b9a6019820789ebc9449c3b81d0eb161becac348b419301a277b95198fc538bb2b0da6465dcc7cd56daeaecbabb4ecbea5abb1d867318ecf97bd1fcd61104eea5bdc301902ee7e6310092207a44084c3b338378a6d73c90771707cd4bfb919cba06913bec55ed087f6a3a1cae2aa5ebc9dff6f80e5a22cb30616212a96568f30ec70fa5a66edb90356f5ead577ece71535c1cc2fa1310098922dcbf5d39f096c10637041563ec9f106b1ee2f3775c1ebbdba89bf450b194b3536f77c169d9d88c95546f64f7e85ee9081fae6a27b68c9e1f8b1ffa6abff6dca529566b84b482a17b6a6787e2c991968553e314dca8adaea7577d343ce652144a0ac4cc12ac51280ca549767f863b1388a541b6cee827f85a2ef3e4d07ce145caea5ec6b83daae2dc35fa2a7e163508f3ca3c8a023b1dec36bbcb9d86c5b1f798acd2cd7ed37349f20b9ef6b3b238be1cf6d3c53034bc12c2d7b5c1c044910646bb80bd75c329c3279dff0025e7dff68e79fe92a2361856903c6ad693f21e880e528421002eafd88f6d1570787661b1140e2030c36a7bdcae6b36690587345e0c8b40d97285dc7d9afb2dc2e23867ed18aa25d5aae775239ea332b232b3bad7006482e92347040523da2fb45abc46a114b351a10064cdde718839c8d46b0dd37d55152909100e70350831b7256ce1e7f70c51e6fa0dff0013ddf82a9e085c956b1dde1a7ede29a3c9945c7ef72f51e3263b3cc3ee1be67fc4537a985aa2ae79104990093bc881b1521c119187a47eccfa927f15b5d8719f3ebf9ecaf634af4e1f23939d7cb5ea7c5bf520daeac2b02645fa1045a01f9ab48b8ba84e238f0cb981c8dff052187c4874438780db430b3a1962dc6f735e294a718cf2d87796d0a238be2053d753f0f324113f7852956b86893fa9b2acf1fc431f58373086b666d00ba3d6d0bdc4cd461a6e7981a4e75355a11678d551f5e7fb20fce50b27f0b74fc20f50e027cb642a8fef757f53a2ff00cbd17d094e17c258fa6d7e675ef63a18f9a82e2782871681de06d12ba1fba6b5b0000236540e2551ce798718048046b0b76328c69c62b922f6762675ea4ddf4f896aecc557ba834bf5b8eb6b5ef752f0a99d8baef6d4753b96468763cc72dd5d55961279e92652f68d2eeb1125d75fdc44a122ce9be0ceb0a4905133c2f08dad4dec7121edbb62204f9dccdbc14af0de1a299bfc5f0ba2f94ba41df69d6342a238697bda4538043839c60491ca215b787e1f3d3cb9fe923581bc5fa8b2adc4cdc6eafa17982a519d9db55cf5fc8fb0386ca3289817b88da3f00a33da13f2f0dc5f5a2e6ff7a1bf8a9f602227e5a2a97b5aab9785d7eaea4df5ad4e7e52aa24eece8e1151564700944a10b0330421080ce85173dcd6304b9ce0d68e6e71868f5217a4fb37c21b428d1c332e18d0d2799d5eef3398f9ae45ec8f83fbdc59aee1dda0d91ffb8f96b7d0673e8bbc709a772ee423d7f5f3404a01165cebdabfb36771434eb51acda75a9b0b21e0e5789cc0170bb60976c755d19080f21f1df67fc4b084fbdc2542d1f5e98f78c8e799931e70ab242f712d4fc330992c693ccb41280f2d7b38f67388e23558f7b1d4f080cd4aa4119c03f0d29f89c749166ea7607d4d86a0da6c6d363435ad686b5a340d6880074002cc04a80f22fb4ee05fb1f12c45103b85def29ff254ef003c092dfecaaf8c055ca1feedf94980e2d21a4f2cda2f5463dc1d8dae6c40a749a7701c0d52478c381f021503db36307bbc3d2dcbdcf8e8d6e5ff00edf24071d1432c0562e23dcc0e0d9fc4ead54ff7c31a7d1a54596c49852ddb2665ab4f0edd68d0a748ff003e5ccef9bc2f4f196be19863eea9b40d18d1fe109bf14764195c4c46b1a19d3af8ab43b0dee1ed9cc18ed40990208d6d10a0bb45c15ef738b1d9db20804f74c91209e93cfc95f4e7e1b47a1c8d3a69cef37cea55f89711a7943441738c1244c09b95970ba803aa35a6436099076e5e1a79263c6f87b693b231b99d32e83980913023c4782d786f78defd1b98fa4062c768503bd977977f42dde1e1dcda2f7ebeff0062cf4f254a72331969275cde9cd5599518fa85a41893026466bceba08b792b6f0fa1f441c0652e6c91b0275552c4e09cc7bc54a65c04f786f371f7add8a52cb195bcc8f8094734e37f224bf6668b64fbff003428018b7739428bfd443a13ff00a4a9ff005ea74bc40ee982a97c46835b23420db7133a42bad56c8239a8f1c219324c8dc1882361e015ae2683a9b1cfe07151a3772632ecd61006079680e23919b13cfc468a78246b56402df4a9aa705122e22b3ad51cdf264de69c52c1b8d27d4faad8f5247aeab2c0e1e5c2f632263f3f556a77096330ac000717438903531637f15aeb575069753761b0aeaa6f849fe08ce07877343c81631de047cbcf5f10ac986c3973f303005846b06e7ca4059f08e0ada6c682734418b4037981e6a5bdd8b585954d7c42949d8e8709837082cdfb053240837eaa95ed85e3fa36a01ff169ff00d615dc0547f6c840e1c47f156a63d0977e0a132c9268e1284a85e19088421c0c5b5dbc7640773f657c37dcf0f6388ef5626a9f03667f85ad3e65749e1ac860eb75cf7b1bc79955f88c13406bb06ff70d02d34a9fd1b4fab1c3d39ae954db000e4210192108400842100cb1fc3855731c6a55686cf758f2d0e98f8a2f222c410449e6ab5c4a9c547b1b52b86831ff0088af3a73cf2ae24aa971c7521565b55a4bfea8702414033a0c6b04001a0493f79249d4ee495c53b67c5ff6cc5bea34fd1b7b94ff0095b37f3249f31c95bfda6768fddb3f64a67bef13508faac3f57c5df778ae694dc8095ecfe0454c45261f843839e7ec33bee9f2691e6b570e2ec6711a675357101f1f673e723c98df927787a9ee7075ab7d6abfbbd3e70eef5623c1b02799525ec8f021d8b7563a5261cb6faef1964783737f782ca2aeec613928c5b6759ad85cf4dcd3de3a8bc68490276160156c82dacea4f6fc4c20468dcd0751b9337e815c7de8f5558e3148d3c4b1ed6178203ad36875efcaeac2949bba653e22096592e1ebe451bb4fc2cd373b23582ae6f799c0bbe7281ad8499f020a8ce11c0da0b6a124b4f7b2902072f437f257de3b806bcc971cdde195a3bb7bb438ee401f7d94253102392df86a509f89f1ea44c6e22a52bc13d1fa74f9702d2680202618f07309048e82de7ebf24fd6355923aa9f38dd58a9a73cb2bb201dc1e94ff00bb1f3fc10a45e6ff00e68513b9a7d1162b1356dfe4ff007648559b418bfaacc2c095900a722a5ec2adcc3026de6397faad29ef0ec23aab9b4e204ce68dac48f15e4da4aecca9c5ca565b963ec970d0e68a86e3613bf7813e361d42b2f0da40d1634ecdca44c8b58893ae89382600d3a61ae39b5fbe7927ec60020080b9fc456cf37f43b1c1e1bbba71d38d41a12a5583ca8c4dd8ca572ef6e98e1eef0d879b97baa9f0637209ff00e43e8ba885e76f68dc6c62f1f55ed334e9fd0d3e45ac2648f171799e50bc3d2b28421002dd837815184e81ed27c0384ad091c2411cd0138ee375303c5f118865cb3155839a747b4d676669f18f500af4e700e33471741988a0eccc7891cc1ddae1b381b10bcaddb739ebb7143e1c552656b682a47bbacd9e62ab2a7a8531ecc7b755386d521d2fc3543f48c1ab4e99d83f886e371d501ea1426bc2f88d2c4526d6a0f6d4a6f12d734d8fe4798d93a400b5d60e8ee100f5048f915b1080ac714a154c9aa5c5a2f6f87d00fbd56ea369d2654c55507b8d2f13b35a26c39ecaff00c5e99751781ca7d083f82e4fed3f1e29e05cc9ef5573583c01ceef286c7f6820392712c53abd57d579973dc5c7cf6f0161e0024c0609f56a3695312e7981c87327a0124f409a35d7953b56a7ecd878d2be2197e74f0e74f075489fe51b4a01bf1dc50ab51946802ea5487baa200bd424f79f03573de67d1761ece764db83c353655033c97d53321cf70d011a81603c01503ec97b185b9788625b048fddd8473feb1dca47c3d0cee23a7e269e68e8745b6949c5dcd15e2a71ca3466125a0dec373f23fad933a544180e21c5b234bc1b90a7f2c286c75573092da6499b7c3bea7516d16d84dbd08f56928a4c8ae36f1458d33120b472cc5a62fe4a921f373e6b1ed9719aaea995cc1dc325b27798d343137500fe2a0b5cc74b5c2f605d60018b78ebd755634251a4b5dca6c55395769c76f7c6e5886a99e3788369d8917dbc35f2b854fc76331102bb5cf6b0d8099cbe3e2b5d3c51ccd797024187137699bfdcbc963b84ac654fb2ff00da52bfc175e84c637858a8f2f351ddebda797442d1fd36e1ad333d014ab4b741bbb244562d2b2dbe45c12858b4ac82b84738cc82e89d9ba6d345aea721b17046fbdf7bcaa9f0ee0e5f4def2d24e8d6cc4e973f257be045dee1a1cd2d23bb07ecda7c3d15663eaa71b2ea5e76450929de5cad07ec0b25a6937ef9f05b953b3a45b02d0ef8b43a6bb2dce205cd80b93c973bed67b53c3510ea7840311574cdfd4b4ff36b53c1b6fb41130d5c75ed4fb5c30940d0a4efde2b34811ad3a66ce79e44dc37ac9d97080138e238ea95eabab56797d4799738fc801b002c06d09baf0f45424420044a122025b04e657a3fb1d678610e3530f55df0b2a3800fa750ed4aa437bdf55cd04d895095b0afa4f753a8d2c7b0e573488208e6b6a95ac7f68c3126f5b0cd041ddf86243483ccd2716907f81eed98101b3b1fdb1c5f0f79761df2c7197d27c9a6ff0011f55df685fc459770ecbfb5be1f8901b59dfb2d53ab6a9ee13f66afc247f3653d179b7322501ecfa355ae01cd70734e841041f02166bc7181c756a17a15aad23ff9751f4ffe9214d37b6fc5223f6fc447f3dfd75f9a03d39c7b8bd0c2d17d6af51b4d801f88ea62c00d5c4f2175e68ed87688e36b66008a4cb5369d63771ea6de806ca1f138da959d9eb547d577f1547b9eef571256dc0e07382f73853a4df8ea1d1bc801abde7668b9e82e8073c1b054ce6ad587d0d119dff6cfd4a60f371b784abbf63bb14faf5063f88b09155f9a9d1803348eebaa03f0d300086ee009b58e7ece780b316e15df4f2e0e83be8293ae6b561f155aa7474587206c2cd33d5aa3331ef7972ff5594575309bd2c8dd9011f25a31566922e7e77b59646af7f2d85adce6eb656690c31730bd5a18b49a636c212592e3702fd3cf7f1507da2e2f4db48d5696b83646b7d40b7a2dd8de2aca4d25efcb3600ee63e4b9a719ae6b3c90406482d6098b1b181bebeaa5d2a0e6f37057e23171a71cbc91ecac5ed2f2e2e39b7111e9aefeab4e170cc0fa8d0d32752771b79291221a2075206c9b56a24ba45e46bc958b86dc94b1a9ba5a232c461d85991c06523c02a4b9f95c581a0b0b8774f5d2eacfc4e8b8d039c8cc01d0fc46f6f4e4a9edaa5a6e0da0971067940507192d56962d7b363e196b7f87dc9375464de9027720923c92a6c417779af6c1e6d13d76e685a6efa7a12ecbafd59d198e98037b79fe0afbc2fb2f4406baa7788b99363afcb4f45cbb84639aefa2821cc179d636904caeabd9dc5b9d45a1d72db0ea351d3a2b0c55493a6a507e653602853559c2a46ef8b936ec33245b68f209e3154b8562cd6c53dc090c60989244c47f64df4f4992559695612eef0b5cdc5ad32795954cd4968ce8694a2f58f23a0147f1be3987c253357115031bb6ee71e4c68bb8f40a93daef6a7468cd2c1c57a9a7bcfea5a7a11fef0f85baecb90f16e295b1350d5af51d51e7776c393468d6f410b51bcb276e3b7d5f1c4d364d2c37fc307bcfeb548d7f945bc6c55392a440084158ca0324249420042124a01539e1b8c346ab6a650e024398747b1c0b2a30f4731ce6f9a69289406fe2bc3bdd386425f45fdea350fd76690793da7bae6ec472225934292c163b2834dedcf45c65cc9821c0407d377d4a805a6e08b1042c71980ca03d8ef7949c603e20876b92a37ea3e36b822ed24680335934a1c16784c33aa3db4d825ce303949dc9d80d49d802807781c3348754aa4b6930c18f89ee370c67da3124e8d124ec0ebc662ea57735a00689cb4a9b7e06663000e6498971b959714c4b5c5b4e999a54c16b0ff113f1d43d5e44f401a364c818b83045c11620f4280f53f04e1acc361e961d9f0d360678902e7c4993e69cd66931062f2b9bfb3ff698dac5b86c690caa7bacada32a1d83ff0081e7d09e4602e965648c5aba19e3e8b6331890441263781f7dbaa4c055a85b2f10660787e7f92705d26dfadd665a00e4b2be9635a8f8b3239ff6c782119ebe6906006ded30373cd526951ca4099317fc615ffb6bc400fa1c81c08cc48d4107bb2b9fe21ed6bb3125b6239ab8c3dfbb4e5ed1, '0000-00-00 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD CONSTRAINT `api_keys_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
