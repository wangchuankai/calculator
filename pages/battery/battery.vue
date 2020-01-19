<template>
	<view class="box">
		<view class="mytab">
			<view class="tabItem" :class="[ite==activeItem?'activeTab':'']" v-for="(ite,index) in tabList" :key="index" @click="tabClick(ite)">
				{{ite}}
			</view>
		</view>
		<view class="title" v-if="countMoth">
			{{activeItem}}{{activeItem!=="我的"?"的":''}}人生进度：一共{{countMoth}}个月(每个小格代表一个月)，已度过{{usemoth===0?"0":usemoth}}个月（黄色部分）
		</view>
		<view class="myBox" v-if="countMoth">
			<view class="item" :class="'item'+item" v-for="(item ,i) in myTotallist" :key="i">
				
			</view>
		</view>
		<view class="massage" v-if="!countMoth">
			<image src="../../static/kong.png" mode="" style="width: 200px; height: 200px;margin: 0 auto;display: block;"></image>
			<view class="txt" style="text-align: center;">
				请完善" 我的 "页面信息后查看
			</view>
		</view>
		<!-- <button type="default" class="normalbtn" @click="addClick">看到了点击一下吧</button> -->
		<!-- <view class="adbanner">
			<ad unit-id="3bb05f156229fef740d3c963b0b0d538"></ad>
		</view> -->
	</view>
</template>

<script>
	export default {
		data(){
			return {
				info:{},
				myTotallist:[],
				tabList:['我的','父亲','母亲'],
				activeItem:"我的",
				countMoth:'',
				usemoth:""
			}
		},
		created() {
			
		},
		mounted() {
			
		},
		methods:{
			addClick(){
				var videoAd = qq.createRewardedVideoAd({              adUnitId: "d94113774bb178db9455e159ecfd94fe"})
				videoAd.onError(function(res){              console.log('videoAd onError',res)})            
				videoAd.onLoad(function(res){              console.log('videoAd onLoad',res)})            
				videoAd.onClose(function(res){              console.log('videoAd onClose',res)})                        
				videoAd.load().then(() => {                console.log('激励视频加载成功');                
				videoAd.show().then(() => {                  console.log('激励视频 广告显示成功')})                
				.catch(err => {                  console.log('激励视频 广告显示失败')})})              
				.catch(err => {                console.log('激励视频加载失败')})    
			},
			tabClick(ite){
				this.activeItem=ite;
				this.myTotallist=[];
				if(ite==="我的"){
					if(this.info && this.info.my && this.info.my.total){
						let mytotal= this.info.my.total;
						let myuse= this.info.my.use;
						for (let i=1;i<=mytotal;i++) {
							if(i<=myuse){
								this.myTotallist.push(2)
							}else{
								this.myTotallist.push(1)
							}
						};
						this.countMoth=this.info.my.total;
						this.usemoth=this.info.my.use;
					}else{
						this.countMoth=0;
					}
					
				}else if(ite==="父亲"){
					if(this.info && this.info.father && this.info.father.total){
						let mytotal= this.info.father.total;
						let myuse= this.info.father.use;
						for (let i=1;i<=mytotal;i++) {
							if(i<=myuse){
								this.myTotallist.push(2)
							}else{
								this.myTotallist.push(1)
							}
						};
						this.countMoth=this.info.father.total;
						this.usemoth=this.info.father.use;
					}else{
						this.countMoth=0;
					}
				}else{
					if(this.info && this.info.mother && this.info.mother.total){
						let mytotal= this.info.mother.total;
						let myuse= this.info.mother.use;
						for (let i=1;i<=mytotal;i++) {
							if(i<=myuse){
								this.myTotallist.push(2)
							}else{
								this.myTotallist.push(1)
							}
						};
						this.countMoth=this.info.mother.total;
						this.usemoth=this.info.mother.use;
					}else{
						this.countMoth=0;
					}
					
				}
			}	
			
		},
		onShow() {
			this.activeItem="我的";
			this.myTotallist=[];
			this.info = uni.getStorageSync("info");
			if(this.info && this.info.my && this.info.my.total){
				let mytotal= this.info.my.total;
				let myuse= this.info.my.use;
				for (let i=1;i<=mytotal;i++) {
					if(i<=myuse){
						this.myTotallist.push(2)
					}else{
						this.myTotallist.push(1)
					}
				};
				this.countMoth=this.info.my.total;
				this.usemoth=this.info.my.use;
			};
			uni.showShareMenu({
				withShareTicket:true,
				title:"时间计算器",
				content:"计算时间间隔、计算年龄，查看人生进度，快来使用吧",
				path:"pages/index/index",
				success(res){
					console.log(res);
				}
			});
		}
	}
</script>

<style scoped>
.box{
	padding: 16px;
}
	
.mytab{
	display: flex;
	flex-wrap: nowrap;
}
	
.tabItem{
	flex: 1;
	text-align: center;
	padding: 8px;
	border: #ccc 1px solid;
}
	
.tabItem:nth-of-type(2){
	border-left: none;
	border-right: none;
}
	
.activeTab{
	background: #1aad19;
	color: #fff;
}
.myBox{
	display: flex;
	flex-wrap: wrap;
	border: #ccc 1px solid;
	border-right: none;
	border-bottom: none;
}

.item{
	width: 10px;
	height: 10px;
	border: #ccc 1px solid;
	border-left: none;
	border-top: none;
	background: #DDDDDD;
}
.item2{
	width: 10px;
	height: 10px;
	border: #ccc 1px solid;
	border-left: none;
	border-top: none;
	background: #ffff7f;
}
.normalbtn{
	border: #ccc 1px solid;
	margin-top: 16px;
	font-size: 16px;
}
.adbanner{
	/* position: absolute; */
	width: 100%;
	height: 200upx;
	margin-top: 40px;
	/* bottom: 0; */
}
/* .item:nth-of-type(26n+1){
	border-left: #ccc 1px solid;
} */
</style>