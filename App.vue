<script>
	export default {
		onLaunch: function() {
			console.log('App Launch')
		},
		onShow: function() {
			    //         let videoAd = qq.createRewardedVideoAd({              adUnitId: "d94113774bb178db9455e159ecfd94fe"            });           
						 // videoAd.onError(function(res){              console.log('videoAd onError',res)            })            
						 // videoAd.onLoad(function(res){              console.log('videoAd onLoad',res)            })            
						 // videoAd.onClose(function(res){              console.log('videoAd onClose',res)            })                        
						 // videoAd.load()              .then(() => {                console.log('激励视频加载成功');                
						 // videoAd.show().then(() => {                  console.log('激励视频 广告显示成功')                })                .catch(err => {                  console.log('激励视频 广告显示失败')                })              })              .catch(err => {                console.log('激励视频加载失败');              })              
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>

<style>
	/*每个页面公共css */
</style>
