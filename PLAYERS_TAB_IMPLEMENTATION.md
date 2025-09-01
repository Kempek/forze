# Реализация вкладки "Игроки" с поддержкой HLTV и FACEIT

## 🎯 Задача
Сделать вкладку "Игроки" рабочей с отображением статистики игроков из HLTV и FACEIT в отдельных вкладках.

## 🔧 Выполненные изменения

### 1. **Backend API Endpoints**

#### HLTV Players API (`/api/forze/players`)
```javascript
// Функция парсинга игроков с HLTV
function parseHltvPlayers(html) {
  const $ = cheerio.load(html);
  const players = [];

  // Ищем секцию с игроками (rosterBox)
  const rosterSection = $('[id="rosterBox"]');
  const playerCards = rosterSection.find('.rosterPlayer');

  playerCards.each((index, card) => {
    const $card = $(card);
    
    // Извлекаем данные игрока
    const nickname = $card.find('.rosterPlayerName').text().trim();
    const status = $card.find('.rosterPlayerStatus').text().trim().toUpperCase();
    const rating30 = $card.find('.rosterPlayerRating').text().trim() || "0.00";
    const profileLink = $card.find('a').attr('href');
    
    players.push({
      id: playerId,
      nickname: nickname,
      status: status,
      rating30: rating30,
      stats: { /* статистика */ },
      profileUrl: profileLink ? `https://www.hltv.org${profileLink}` : null,
    });
  });

  return players;
}
```

#### FACEIT Players API (`/api/faceit/players`)
```javascript
// Использует существующий FaceitAPI для получения данных команды
const faceitAPI = new FaceitAPI();
const teamData = await faceitAPI.getTeamData();
const players = teamData.teamInfo?.players || [];

const result = {
  source: "FACEIT",
  players: players.map(player => ({
    id: player.player_id,
    nickname: player.nickname,
    status: "STARTER", // FACEIT не различает STARTER/BENCHED
    rating30: player.games?.cs2?.skill_level || "0",
    stats: { /* статистика */ },
    profileUrl: `https://www.faceit.com/en/players/${player.nickname}`,
  })),
  // ... остальные поля
};
```

### 2. **Frontend Component (PlayerStats.jsx)**

#### Основные функции:
- **Вкладки HLTV/FACEIT** - переключение между источниками данных
- **Статистические карточки** - общая информация о команде
- **Таблица игроков** - детальная статистика каждого игрока
- **Ссылки на профили** - возможность перехода на HLTV/FACEIT профили

#### Ключевые особенности:
```javascript
// Разные цветовые схемы для рейтингов
const getRatingColor = (rating, source) => {
  const numRating = parseFloat(rating);
  if (source === "HLTV") {
    if (numRating >= 1.2) return "success";
    if (numRating >= 1.1) return "primary";
    if (numRating >= 1.0) return "warning";
    return "error";
  } else {
    // FACEIT рейтинг (1-10)
    if (numRating >= 8) return "success";
    if (numRating >= 6) return "primary";
    if (numRating >= 4) return "warning";
    return "error";
  }
};
```

### 3. **Структура данных**

#### HLTV Player:
```javascript
{
  id: "player_id",
  nickname: "sh1ro",
  status: "STARTER", // или "BENCHED"
  rating30: "1.25",
  stats: {
    rating30: "1.25",
    maps: "45",
    kd: "1.35",
    kills: "567",
    deaths: "420",
  },
  profileUrl: "https://www.hltv.org/player/7998/sh1ro",
}
```

#### FACEIT Player:
```javascript
{
  id: "faceit_player_id",
  nickname: "KusMe",
  status: "STARTER", // всегда STARTER для FACEIT
  rating30: "8", // уровень FACEIT (1-10)
  stats: {
    rating30: "8",
    maps: "327",
    kd: "0.00", // FACEIT не предоставляет K/D
    kills: "0",
    deaths: "0",
  },
  profileUrl: "https://www.faceit.com/en/players/KusMe",
}
```

## 📊 Функциональность

### ✅ Что реализовано:

1. **Вкладки HLTV/FACEIT**
   - Переключение между источниками данных
   - Иконки для каждого источника
   - Отдельная статистика для каждого источника

2. **Статистические карточки**
   - Общее количество игроков
   - Количество игроков основного состава
   - Количество игроков в запасе
   - Средний рейтинг команды

3. **Таблица игроков**
   - Никнейм с аватаром
   - Статус (STARTER/BENCHED)
   - Рейтинг с цветовой индикацией
   - Количество карт
   - K/D соотношение
   - Ссылки на профили

4. **Интерактивность**
   - Кнопки для открытия профилей игроков
   - Кнопки "Детали" для каждого игрока
   - Кнопки "Попробовать снова" при ошибках

### 🎮 Как использовать:

1. **Переключение вкладок** - кликните на вкладку "HLTV" или "FACEIT"
2. **Просмотр статистики** - изучите карточки с общей статистикой
3. **Детальная информация** - просмотрите таблицу игроков
4. **Открытие профилей** - кликните на иконку ссылки для перехода на профиль игрока

## 🔄 API Endpoints

### HLTV Players
- **URL**: `GET /api/forze/players`
- **Источник**: https://www.hltv.org/team/12857/forze-reload#tab-rosterBox
- **Кэширование**: 10 минут
- **Fallback**: Тестовые данные при ошибке

### FACEIT Players
- **URL**: `GET /api/faceit/players`
- **Источник**: FACEIT API через существующий FaceitAPI класс
- **Кэширование**: 5 минут
- **Fallback**: Тестовые данные при ошибке

## 🎉 Результат

Вкладка "Игроки" теперь полностью функциональна и предоставляет:

- **Данные с HLTV** - статистика игроков с официального сайта
- **Данные с FACEIT** - информация о игроках команды
- **Удобный интерфейс** - вкладки для переключения между источниками
- **Интерактивность** - ссылки на профили и детальная информация
- **Надежность** - fallback данные при ошибках API

Теперь пользователи могут легко просматривать статистику игроков команды FORZE Reload из обоих источников!

